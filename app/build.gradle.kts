// app/build.gradle.kts
import java.io.FileInputStream
import java.util.Properties
import java.io.File

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

// Logic to load signing properties file created by the CI/CD pipeline
val signingPropertiesFile = File(project.rootDir, "signing.properties")
val signingProperties = Properties()
if (signingPropertiesFile.exists()) {
    signingProperties.load(FileInputStream(signingPropertiesFile))
}

android {
    namespace = "com.vtkr.voidlauncher"
    compileSdk = 34 

    defaultConfig {
        applicationId = "com.vtkr.voidlauncher"
        minSdk = 24 
        targetSdk = 34 
        versionCode = 1
        versionName = "1.0"
    }

    signingConfigs {
        create("release") {
            // Reference the values loaded from the properties file
            keyAlias = signingProperties.getProperty("keyAlias", "")
            keyPassword = signingProperties.getProperty("keyPassword", "")
            storeFile = File(signingProperties.getProperty("storeFile", ""))
            storePassword = signingProperties.getProperty("storePassword", "")
        }
    }
    
    buildTypes {
        getByName("release") {
            isMinifyEnabled = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
            // Apply the signing config defined above
            signingConfig = signingConfigs.getByName("release")
        }
        getByName("debug") {
            // Default debug settings
        }
    }
}

dependencies {
    // Core AndroidX and Kotlin dependencies
    implementation("androidx.core:core-ktx:1.12.0")
    implementation("androidx.appcompat:appcompat:1.6.1")
    implementation("com.google.android.material:material:1.11.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
}