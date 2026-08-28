import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uniceps/app/domain/classes/diet_classes/diet_category.dart';
import 'package:uniceps/app/domain/classes/diet_classes/ingredient.dart';
import 'package:uniceps/app/presentation/blocs/app_config/app_config_cubit.dart';
import 'package:uniceps/app/presentation/diet_logger/blocs/ingredients/ingredients_bloc.dart';
import 'package:uniceps/app/presentation/diet_logger/dialogs/add_edit_ingredient_dialog.dart';
import 'package:uniceps/app/presentation/diet_logger/dialogs/ingredient_details_dialog.dart';
import 'package:uniceps/app/presentation/diet_logger/widgets/ingredient_tile.dart';
import 'package:uniceps/app/presentation/settings/dialogs/content_lang_dialog.dart';
import 'package:uniceps/core/Themes/light_theme.dart';
import 'package:uniceps/core/errors/failure.dart';
import 'package:uniceps/l10n/app_localizations.dart';

class IngredientsScreen extends StatefulWidget {
  const IngredientsScreen({super.key});

  @override
  State<IngredientsScreen> createState() => _IngredientsScreenState();
}

class _IngredientsScreenState extends State<IngredientsScreen> {
  final _searchController = TextEditingController();
  final _searchNode = FocusNode();
  int? _selectedCategory;
  String _searchString = '';

  @override
  void dispose() {
    _searchController.dispose();
    _searchNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return BlocConsumer<IngredientsBloc, IngredientsState>(
      listener: (context, state) {
        state.maybeWhen(
          languageChangeSuccess: (lang) {
            context.read<AppConfigCubit>().changeDietLibLanguageTo(lang);
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(locale.langChangedSuccess), backgroundColor: Colors.green));
          },
          failure: (failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(failure.maybeWhen(orElse: () => locale.errNoInternet)),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      // buildWhen: (p, c) => c.maybeWhen(orElse: () => true, changingLanguage: () => false),
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: back2,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: 160,
                    backgroundColor: mainBlueLight,
                    leading: const BackButton(color: Colors.white),
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.swap_horiz),
                        color: Colors.white,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (_) => BlocProvider.value(
                              value: context.read<IngredientsBloc>(),
                              child: ContentLangDialog(
                                title: locale.changeIngredientsLanguage,
                                langCode: context.read<AppConfigCubit>().state.config.dietLibLanguage.languageCode,
                                onLangChanged: (code) => context.read<IngredientsBloc>().add(
                                  IngredientsEvent.changeLibLanguage(language: code),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        locale.ingredients,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      background: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [mainBlue, mainBlueLight],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 50),
                              child: Text(
                                locale.ingredientsDbInfo,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _searchController,
                            focusNode: _searchNode,
                            onChanged: (search) {
                              _searchString = search;
                              context.read<IngredientsBloc>().add(
                                IngredientsEvent.filter(search: _searchString, catId: _selectedCategory),
                              );
                            },
                            onTapOutside: (_) => _searchNode.unfocus(),
                            decoration: InputDecoration(
                              hintText: locale.search,
                              prefixIcon: const Icon(Icons.search),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          state.maybeWhen(
                            orElse: () => const SizedBox(),
                            success: (ingredients, categories) {
                              return SizedBox(
                                height: 40,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    final cat = categories[index];
                                    final isSelected = _selectedCategory == cat.id;
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: ChoiceChip(
                                        label: Text(cat.name),
                                        selected: isSelected,
                                        onSelected: (val) => setState(() => _selectedCategory = val ? cat.id : null),
                                        selectedColor: secondaryBlue,
                                        checkmarkColor: Colors.white,
                                        labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  state.maybeWhen(
                    loading: () => const SliverToBoxAdapter(child: LinearProgressIndicator()),
                    changingLanguage: () => const SliverToBoxAdapter(child: LinearProgressIndicator()),
                    orElse: () => SliverToBoxAdapter(child: Center(child: Text(locale.empty))),
                    success: (ingredients, categories) {
                      final filtered = ingredients
                          .where((i) => i.categoryId == _selectedCategory || _selectedCategory == null)
                          .toList();
                      if (filtered.isEmpty) {
                        return SliverToBoxAdapter(child: Center(child: Text(locale.empty)));
                      }
                      return SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          final ing = filtered[index];
                          return IngredientTile(ingredient: ing, onTap: () => _showDetailsDialog(ing, categories));
                        }, childCount: filtered.length),
                      );
                    },
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 80)),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => _showAddEditDialog(null, state.maybeWhen(orElse: () => [], success: (_, cat) => cat)),
                backgroundColor: mainBlueLight,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showAddEditDialog(Ingredient? ingredient, List<DietCategory> categories) {
    showDialog(
      context: context,
      builder: (context) => AddEditIngredientDialog(ingredient: ingredient, categories: categories),
    );
  }

  void _showDetailsDialog(Ingredient ingredient, List<DietCategory> categories) {
    showDialog(
      context: context,
      builder: (context) => IngredientDetailsDialog(
        ingredient: ingredient,
        onEdit: () => _showAddEditDialog(ingredient, categories),
        onDelete: () => _showDeleteConfirm(ingredient),
        onAdd: (amount) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Logged ${amount.toStringAsFixed(0)}g of ${ingredient.name}')));
        },
      ),
    );
  }

  void _showDeleteConfirm(Ingredient ingredient) {
    final locale = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(locale.deleteIngredient),
        content: Text(locale.deleteConfirm(ingredient.name)),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(locale.cancel)),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(locale.delete, style: const TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
