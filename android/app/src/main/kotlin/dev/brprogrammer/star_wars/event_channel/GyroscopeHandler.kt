package dev.brprogrammer.star_wars.event_channel

import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import io.flutter.plugin.common.EventChannel

class GyroscopeHandler(private val sensorManager: SensorManager) : EventChannel.StreamHandler {

    private var gyroscopeListener: SensorEventListener? = null
    private lateinit var gyroscope: Sensor;

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        gyroscope = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE)
        if (events != null) {
            gyroscopeListener = createGyroscopeEventListener(events)
            sensorManager.registerListener(
                gyroscopeListener,
                gyroscope,
                SensorManager.SENSOR_DELAY_NORMAL,
            )
        }
    }

    override fun onCancel(arguments: Any?) {
        if (gyroscopeListener != null) {
            sensorManager.unregisterListener(gyroscopeListener)
        }
    }

    private fun createGyroscopeEventListener(events: EventChannel.EventSink): SensorEventListener {
        return object : SensorEventListener {
            override fun onAccuracyChanged(sensor: Sensor, accuracy: Int) {}
            override fun onSensorChanged(event: SensorEvent) {
                val values = event.values
                val gyroscopeValues = LinkedHashMap<String, Float>()
                gyroscopeValues["x"] = values[0]
                gyroscopeValues["y"] = values[1]
                gyroscopeValues["z"] = values[2]
                events.success(gyroscopeValues)
            }
        }
    }
}

