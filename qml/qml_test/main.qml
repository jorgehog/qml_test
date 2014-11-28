import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.0

ApplicationWindow {

    id: applicationWindow1
    visible: true
    width: 1280
    height: 800
    title: qsTr("COLOR TIME")


    ComboBox
    {
        height: applicationWindow1.width/30
        width: applicationWindow1.width/10

        id: cb

        currentIndex: 0

        model: ListModel
        {
            id: cbitems
            ListElement {text: "add"}
            ListElement {text: "multiply"}
        }
    }

    TextField
    {
        id: tf1

        height: cb.height
        width: cb.width

        inputMethodHints: Qt.ImhDigitsOnly
        placeholderText: "Enter a number"
        anchors.left: cb.right

    }

    Button
    {
        id: button
        text: "Compute"

        height: cb.height
        width: cb.width

        anchors.left: tf1.right

        onClicked: {

            if (cb.currentIndex == 0)
            {
                label.text = mathengine.add(label.text, tf1.text)
            }
            else
            {
                label.text = mathengine.multiply(label.text, tf1.text)
            }

        }
    }

    Button
    {
        id: resetButton

        text: "Reset"

        height: cb.height
        width: cb.width

        anchors.left: button.right

        onClicked:
        {
            label.text = 1
        }

    }




    Rectangle
    {
        id: field1
        anchors.centerIn: parent
        width: parent.width/2
        height: parent.height/2
        color: "red"
        property string newColor: "None"

        ColorAnimation on color {
            id: animation
            duration: 200
            to: field1.newColor

            running: false

        }

        MouseArea {
            anchors.fill: parent
            onClicked: {

                if (field1.color == "#ff0000")
                {
                    field1.newColor = "blue";
                }
                else
                {
                    field1.newColor = "red"
                }

                timer.restart()

                animation.start()

            }
        }


    }

    Text {
        id: label

        text: qsTr("1")
        anchors.centerIn: parent
        font.pixelSize: parent.height/20
    }

    Timer
    {
        id: timer

        interval: 3000
        running: true
        repeat: true

        onTriggered:
        {
            field1.newColor = "green"
            animation.start()
        }

    }
}
