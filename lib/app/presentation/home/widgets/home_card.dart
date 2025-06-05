import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradient_circular_progress_indicator/gradient_circular_progress_indicator.dart';
import 'package:intl/intl.dart';
import 'package:uniceps/core/constants/constants.dart';
import 'package:uniceps/core/widgets/error_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:uniceps/app/presentation/blocs/current_gym/current_gym_bloc.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: [
          //
          //  H O M E   C A R D
          //
          Padding(
            padding: const EdgeInsets.all(15),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //
                        //  Q R   A N D   S W I T C H   B T N s
                        //
                        Row(
                          children: [
                            Material(
                              // elevation: 3,
                              borderRadius: BorderRadius.circular(8),
                              // color: Color.fromARGB(138, 41, 91, 121),
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withAlpha(190),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 3.0),
                                  child: Icon(
                                    Icons.cached,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Material(
                              // elevation: 3,
                              borderRadius: BorderRadius.circular(8),
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withAlpha(100),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(8),
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.0, vertical: 3.0),
                                  child: Icon(Icons.qr_code),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //
                        //  G Y M   I N F O   S E C T I O N
                        //
                        BlocBuilder<CurrentGymBloc, CurrentGymState>(
                          builder: (context, state) {
                            if (state is CurrentGymLoadedState) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    borderRadius: BorderRadius.circular(15.0),
                                    onTapUp: (details) {},
                                    child: Row(
                                      children: [
                                        CachedNetworkImage(
                                          width: 40,
                                          imageUrl: "$API"
                                              "$HTTP_GYMS"
                                              "$HTTP_GYM_LOGO"
                                              "/${state.current.id}",
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            child: Image(image: imageProvider),
                                          ),
                                          errorWidget: (context, url, error) {
                                            return const Image(
                                              image: AssetImage(
                                                "images/logo/Logo-dark.png",
                                              ),
                                              width: 30,
                                            );
                                          },
                                        ),
                                        const SizedBox(width: 5),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          // height: 30,
                                          child: Text(
                                            // "${name[0].trim()}"
                                            // "\n"
                                            // "${name[1].trim()}",
                                            // "النادي العربي الرياضي الاوحد",
                                            state.current.name,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                // color:
                                                //     Theme.of(context).colorScheme.secondary,
                                                fontSize:
                                                    state.current.name.length <
                                                            14
                                                        ? 20
                                                        : state.current.name
                                                                    .length <=
                                                                20
                                                            ? 15
                                                            : 11,
                                                // fontSize: 35 - myGym.name.length.toDouble(),
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    local.endOfSubDate,
                                    style: const TextStyle(
                                      color: Colors.black45,
                                      // fontWeight: FontWeight.bold,
                                      fontSize: 11,
                                    ),
                                  ),
                                  Text(
                                    DateFormat("dd/MM/yyyy")
                                        .format(state.current.end!),
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is CurrentGymErrorState) {
                              return SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.1,
                                width: MediaQuery.sizeOf(context).width * 0.6,
                                child: ErrorScreenWidget(
                                    f: state.f, callback: null),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    //
                    //  L E V E L   I N D I C A T O R
                    //
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.height * 0.13,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GradientCircularProgressIndicator(
                            progress: 0.5,
                            backgroundColor: Colors.grey.shade200,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Theme.of(context).colorScheme.secondary,
                                Theme.of(context).colorScheme.primary,
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "lvl: ${5}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  "${((0.5 * 100).round() - (0.5 * 100))}%",
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
