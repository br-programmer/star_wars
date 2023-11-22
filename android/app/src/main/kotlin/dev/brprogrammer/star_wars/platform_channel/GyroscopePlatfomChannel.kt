package dev.brprogrammer.star_wars.platform_channel

import android.hardware.Sensor
import android.hardware.SensorManager
import dev.brprogrammer.star_wars.event_channel.GyroscopeHandler
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class GyroscopePlatfomChannel(
    private val sensorManager: SensorManager,
    private val messenger: BinaryMessenger
) : MethodChannel.MethodCallHandler {

    private val channel = "dev.brprogrammer.star_wars/gyroscope"
    private val event = "dev.brprogrammer.star_wars/gyroscope-listener"

    init {
        val methodChannel = MethodChannel(messenger, channel)
        methodChannel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "check" -> {
                val exist = existGyroscope()
                result.success(exist)
                if (exist) createListener()
            }

            else -> result.notImplemented()
        }
    }

    private fun existGyroscope(): Boolean =
        sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE) != null

    private fun createListener() {
        val gyroscopeHandler = GyroscopeHandler(sensorManager)
        val eventChannel = EventChannel(messenger, event)
        eventChannel.setStreamHandler(gyroscopeHandler)
    }
}