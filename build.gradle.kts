// build.gradle.kts
plugins {
    // Defines the dependency for the Android Gradle Plugin (AGP)
    id("com.android.application") version "8.3.0" apply false 
    // Defines the dependency for the Kotlin Gradle plugin
    id("org.jetbrains.kotlin.android") version "2.2.20" apply false
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}