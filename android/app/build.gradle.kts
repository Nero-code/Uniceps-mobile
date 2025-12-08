import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    id("kotlin-android")
    
    id ("com.google.gms.google-services")
    
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}


// 1. Load Keystore Properties
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")

if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(FileInputStream(keystorePropertiesFile))
}

android {
    namespace = "com.trioverse.uniceps"
    compileSdk = flutter.compileSdkVersion
    // compileSdk = 34
    ndkVersion = "28.2.13676358"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21
        targetCompatibility = JavaVersion.VERSION_21
        isCoreLibraryDesugaringEnabled = true
    }

    kotlin {
        jvmToolchain(21) // Sets jvmTarget to 21, but uses a different syntax
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.trioverse.uniceps"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        // targetSdk = 34
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }
    signingConfigs {
        create("release") {
            // Note: Use '?.let { file(it) }' for 'storeFile' to handle a potentially null value
            // if the key.properties file is missing (e.g., during a debug build).
            keyAlias = keystoreProperties["keyAlias"] as String
            keyPassword = keystoreProperties["keyPassword"] as String
            storeFile = keystoreProperties["storeFile"]?.let { file(it as String) }
            storePassword = keystoreProperties["storePassword"] as String

        }
    }
    buildTypes {
        // 3. Apply Signing Configuration to Release Build Type
        getByName("release") {
            // Common release-specific configurations
            isMinifyEnabled = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )

            // Apply the new 'release' signing config
            signingConfig = signingConfigs.getByName("release")
        }
    }



    dependencies {
        coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.5")
    }
}

flutter {
    source = "../.."
}
