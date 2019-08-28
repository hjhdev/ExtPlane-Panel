import QtQuick 2.0
import ".." as PanelItems

PanelItems.PanelItem {
    property double gaugeValue: 0
    property double barValue: 10
    property double thinBarValue: 0
    property double barsAngleZero: 0
    property double valueMax: 100
    property string topLabel: ""
    property string bottomLabel: ""
    property double valueMultiplier: 1

    width: Math.min(parent.width, parent.height)

    CircularGaugeBars {
        id: valueBars
        thickBars: true
        showValue: true
        barValue: parent.barValue
        barsAngleZero: parent.barsAngleZero
        valueMax: parent.valueMax
        valueMultiplier: parent.valueMultiplier
        Needle {
            transformOrigin: Item.Right
            y: parent.height / 2
            rotation: valueBars.value2Angle(gaugeValue)
        }
    }
    CircularGaugeBars {
        barValue: thinBarValue
        visible: thinBarValue
        barsAngleZero: parent.barsAngleZero
        valueMax: parent.valueMax
        z: -10
    }
    Text {
        text: topLabel
        color: "white"
        anchors.horizontalCenter: valueBars.horizontalCenter
        anchors.top: valueBars.top
        anchors.topMargin: valueBars.height / 3
        z: -5
    }
    Text {
        text: bottomLabel
        color: "white"
        anchors.horizontalCenter: valueBars.horizontalCenter
        anchors.bottom: valueBars.bottom
        anchors.bottomMargin: valueBars.height / 3
        z: -5
    }
}