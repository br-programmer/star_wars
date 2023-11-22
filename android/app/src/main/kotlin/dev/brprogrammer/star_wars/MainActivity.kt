package dev.brprogrammer.star_wars

import android.content.Context
import android.hardware.SensorManager
import dev.brprogrammer.star_wars.platform_channel.GyroscopePlatfomChannel
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine


class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val binaryMessenger = flutterEngine.dartExecutor.binaryMessenger
        val sensorsManager = context.getSystemService(Context.SENSOR_SERVICE) as SensorManager
        GyroscopePlatfomChannel(sensorsManager, binaryMessenger)

    }

}


