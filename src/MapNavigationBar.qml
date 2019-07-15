import QtQuick 2.9
import QtQuick.Layouts 1.3

Item {
    id: __root
    signal searchButtonClicked()
    signal startButtonClicked()
    signal routeDetailsClicked()
    signal cancelButtonClicked()
    signal settingsButtonClicked()

    Rectangle {
        id: leftButton
        width: parent.width * 0.1
        height: parent.width * 0.1
        color: "#ffffff"
        radius: height/2
        anchors.verticalCenter: parent.verticalCenter
        clip: true
        border.width: 1
        anchors.left: parent.left
        anchors.leftMargin: 0

        Behavior on width {
            NumberAnimation { easing.type: Easing.InOutQuad; }
        }

        Rectangle {
            id: leftDivider
            width: 1
            color: "#000000"
            anchors.verticalCenter: parent.verticalCenter
            visible: false
            anchors.leftMargin: parent.height + 1
            anchors.left: parent.left
            Behavior on height {
                NumberAnimation { easing.type: Easing.InOutQuad; }
            }
        }

        Item {
            id: leftWrapper1
            width: parent.height
            height: timeLeft1.height + distanceLeft1.height
            visible: false
            anchors.leftMargin: parent.height * 1.1
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            Text {
                id: timeLeft1
                text: qsTr("15 mins")
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -height / 2
                font.pixelSize: 25
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: distanceLeft1
                text: qsTr("5 km")
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: height / 2
                anchors.left: timeLeft1.left
                font.pixelSize: 20
            }
            clip: false
        }

        Image {
            id: image
            width: height
            height: parent.height * 0.5
            anchors.leftMargin: (parent.height - width) / 2
            anchors.left: parent.left
            anchors.rightMargin: (parent.height - width) / 2
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "assets/ionicons/md-search.svg"
            sourceSize.width: width
            sourceSize.height: height
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                __root.searchButtonClicked()
            }
        }
    }

    Rectangle {
        id: rightButton
        width: parent.width * 0.1
        height: parent.width * 0.1
        color: "#ffffff"
        radius: height/2
        anchors.verticalCenter: parent.verticalCenter
        clip: true
        border.width: 2
        anchors.right: parent.right

        Behavior on width {
            NumberAnimation { easing.type: Easing.InOutQuad; }
        }

        Rectangle {
            id: rightDivider
            width: 1
            height: 0
            color: "#000000"
            anchors.verticalCenter: parent.verticalCenter
            visible: false
            anchors.rightMargin: parent.height
            anchors.right: parent.right
            Behavior on height {
                NumberAnimation { easing.type: Easing.InOutQuad; }
            }
        }

        Item {
            id: rightWrapper1
            width: parent.height * 1.25
            height: arrivingTimeLabel1.height + arrivingTime1.height
            visible: false
            anchors.rightMargin: parent.height
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            Text {
                id: arrivingTimeLabel1
                text: qsTr("Arriving:")
                font.pixelSize: 18
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: arrivingTime1
                text: qsTr("16:29")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 36
            }


        }

        Image {
            id: image1
            width: height
            height: parent.height * 0.5
            anchors.rightMargin: (parent.height - width) / 2
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            fillMode: Image.PreserveAspectFit
            source: "assets/ionicons/md-settings.svg"
            sourceSize.width: width
            sourceSize.height: height
        }

        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            onClicked: {
                if(__root.state == "")
                    __root.state = "navigationState"
                else
                    __root.state = ""
            }
        }
    }

    Rectangle{
        id: buttonsWrapper
        anchors.rightMargin: height
        anchors.leftMargin: height
        anchors.right: parent.right
        anchors.left: parent.left
        height: parent.width * 0.1
        anchors.verticalCenter: parent.verticalCenter
        border.width: 1
        visible: false
        RowLayout {
            id: rowLayout
        spacing: 0
        anchors.fill: parent

        Item {
            id: element1
            visible: true
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                id: rectangle7
                x: 50
                y: 23
                color: "#ffffff"
                anchors.fill: parent
            }

            Item {
                id: leftWrapper
                width: parent.height
                anchors.verticalCenter: parent.verticalCenter
                clip: false
                height: timeLeft.height + distanceLeft.height
                anchors.horizontalCenter: parent.horizontalCenter


                Text {
                    id: timeLeft
                    text: qsTr("15 mins")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenterOffset: -height / 2
                    anchors.verticalCenter: parent.verticalCenter
                    font.pixelSize: 25
                }



                Text {
                    id: distanceLeft
                    text: qsTr("5 km")
                    anchors.verticalCenterOffset: height / 2
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: timeLeft.left
                    font.pixelSize: 20
                }

            }

        }

        Item {
            id: element2
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                id: rectangle
                color: "#f30303"
                anchors.fill: parent
            }

            Rectangle {
                id: rectangle3
                width: 1
                color: "#000000"
                anchors.left: parent.left
                anchors.leftMargin: 0
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
            }


            Text {
                id: element6
                color: "#ffffff"
                text: qsTr("Cancel")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.left: parent.left
                anchors.right: parent.right
                font.pixelSize: 24
            }



        }

        Item {
            id: element3
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                id: rectangle1
                color: "#7d7474"
                anchors.fill: parent
            }

            Rectangle {
                id: rectangle6
                width: 1
                color: "#000000"
                anchors.leftMargin: 0
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.left: parent.left
            }


            Rectangle {
                id: rectangle5
                width: 1
                color: "#000000"
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
                anchors.top: parent.top
                anchors.right: parent.right
            }


            Text {
                id: element8
                color: "#ffffff"
                text: qsTr("Route Details")
                verticalAlignment: Text.AlignVCenter
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                anchors.left: parent.left
                anchors.right: parent.right
                font.pixelSize: 24
            }




        }

        Item {
            id: element4
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                id: rectangle2
                color: "#0df741"
                anchors.fill: parent
            }

            Rectangle {
                id: rectangle4
                width: 1
                color: "#000000"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.bottom: parent.bottom
            }


            Text {
                id: element7
                color: "#ffffff"
                text: qsTr("Start")
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                verticalAlignment: Text.AlignVCenter
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 24
            }
        }

        Item {
            id: element5
            Layout.fillHeight: true
            Layout.fillWidth: true

            Rectangle {
                color: "#ffffff"
                anchors.fill: parent
            }

            Item {
                id: rightWrapper
                height: arrivingTimeLabel.height + arrivingTime.height
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.height * 1
                anchors.verticalCenter: parent.verticalCenter
                Text {
                    id: arrivingTimeLabel
                    text: qsTr("Arriving:")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    font.pixelSize: 18
                }

                Text {
                    id: arrivingTime
                    text: qsTr("16:29")
                    anchors.bottom: parent.bottom
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 36
                }

            }

        }
    }
    }
    states: [
        State {
            name: "navigationState"

            PropertyChanges {
                target: leftButton
                width: parent.width * 0.25
                height: parent.width * 0.1
            }

            PropertyChanges {
                target: rightButton
                width: parent.width * 0.25
                height: parent.width * 0.1
            }

            PropertyChanges {
                target: rightDivider
                height: parent.height
                visible: true
            }

            PropertyChanges {
                target: leftDivider
                height: parent.height
                anchors.leftMargin: parent.height
                visible: true
            }

            PropertyChanges {
                target: rightWrapper1
                visible: true
            }

            PropertyChanges {
                target: leftWrapper1
                visible: true
            }

        },
        State {
            name: "destinationState"
            PropertyChanges {
                target: leftButton
                width: height * 2.5
                visible: false
            }

            PropertyChanges {
                target: rightButton
                width: height * 2.5
                visible: false
            }
            PropertyChanges {
                target: buttonsWrapper
                border.color: "#000000"
                visible: true
            }

            PropertyChanges {
                target: rowLayout
                anchors.rightMargin: 1
                anchors.leftMargin: 1
                anchors.bottomMargin: 1
                anchors.topMargin: 1
            }
        }
    ]

}












/*##^## Designer {
    D{i:0;autoSize:true;height:300;width:1200}D{i:2;anchors_height:200}D{i:4;anchors_height:200}
D{i:3;anchors_height:200;anchors_x:20}D{i:6;anchors_x:24;anchors_y:37}D{i:7;anchors_height:100;anchors_width:100}
D{i:9;anchors_height:200}D{i:14;anchors_height:100;anchors_width:100}D{i:8;anchors_height:200}
}
 ##^##*/
