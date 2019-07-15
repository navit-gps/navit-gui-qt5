import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3


Item {
    id: element
    ListView {
        id:pois
        height: parent.height * 0.25
        anchors.rightMargin: 1
        anchors.leftMargin: 1
        anchors.topMargin: 2
        spacing: 10
        clip: true
        orientation: ListView.Horizontal
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        ScrollBar.horizontal: ScrollBar {
            id:poisScrollBar
            parent: pois.parent
            anchors.left: pois.left
            anchors.right: pois.right
            anchors.bottom: pois.bottom
            height: pois.height * 0.15
            active: true
            contentItem: Rectangle {
                radius: height / 2
                border.width: 1

            }
            background:Rectangle {
                height: 1
                color: "#000000"
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        delegate: Rectangle {
            id: poiDelegate
            width: pois.height * 0.7
            height: width
            color: "#ffffff"
            radius: width / 2
            Layout.fillHeight: true
            Layout.fillWidth: true
            border.width: 1

            Image {
                id: image
                width: parent.width * 0.4
                height: parent.height * 0.4
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                fillMode: Image.PreserveAspectFit
                source: model.icon
                sourceSize.width: width
                sourceSize.height: height
            }
        }
        model:ListModel{
            ListElement {
                name: "Petrol Station"
                icon: "qrc:/assets/osmic/transport/fuel-14.svg"
            }
            ListElement {
                name: "Car Park"
                icon: "qrc:/assets/osmic/transport/parking-car-14.svg"
            }
            ListElement {
                name: "Hotel"
                icon: "qrc:/assets/osmic/accommodation/hotel-14.svg"
            }
            ListElement {
                name: "Restaurant"
                icon: "qrc:/assets/osmic/eat-drink/restaurant-14.svg"
            }
            ListElement {
                name: "Bus"
                icon: "qrc:/assets/osmic/transport/bus-stop-14.svg"
            }
            ListElement {
                name: "Airport"
                icon: "qrc:/assets/osmic/transport/airport-14.svg"
            }
            ListElement {
                name: "Cafe"
                icon: "qrc:/assets/osmic/eat-drink/cafe-14.svg"
            }
            ListElement {
                name: "Information"
                icon: "qrc:/assets/osmic/tourism/information-14.svg"
            }
            ListElement {
                name: "Museum"
                icon: "qrc:/assets/osmic/tourism/museum-14.svg"
            }
        }
    }

    TabBar {
        id: tabBar
        height: parent.height * 0.1
        anchors.topMargin: parent.height * 0.02
        anchors.top: pois.bottom
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        background: Rectangle {
            color: "#00ffffff"
            }

        TabButton {
            id: tabButton
            text: qsTr("Recent")
            font.pointSize: 12
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            background:  Rectangle {
                color: tabBar.currentIndex === 0 ? "#ffffff" : "#a4a4a4"
                implicitWidth: 100
                implicitHeight: 40
                radius: contentRect.radius / 2
                anchors.left: parent.left
                anchors.right: parent.right
                height: parent.height + radius
            }
        }

        TabButton {
            id: tabButton1
            text: qsTr("Favourites")
            font.pointSize: 12
            anchors.top: parent.top
            anchors.topMargin: 0
            anchors.bottom: parent.bottom
            background: Rectangle {
                color: tabBar.currentIndex === 1 ? "#ffffff" : "#a4a4a4"
                implicitWidth: 100
                implicitHeight: 40
                radius: contentRect.radius / 2
                anchors.left: parent.left
                anchors.right: parent.right
                height: parent.height + radius
            }
        }
    }

    Rectangle {
        id: rectangle2
        color: "#ffffff"
        radius: contentRect.radius / 2
        anchors.top: tabBar.bottom
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0

        Rectangle {
            id: rectangle1
            x: tabBar.currentIndex === 1 ? width : 0
            width: parent.width / 2
            color: "#ffffff"
            anchors.bottomMargin: parent.radius
            anchors.bottom: parent.bottom
            anchors.top: parent.top
            anchors.topMargin: 0
        }
    }


}







/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/
