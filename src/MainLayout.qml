import QtQuick 2.9
import QtQuick.Layouts 1.3

Item {
    id: __root

    Rectangle {
        id: element8
        color: "#c84949"
        anchors.fill: parent

    }
    MouseArea {
        id: mouseArea4
        enabled: true
        anchors.fill: __root
        onClicked: {
            if(__root.state == ""){
                __root.state = "mapControlsVisible"
            }
        }
    }


    MapControls {
        id: mapControls
        x: -width
        width: parent.width * 0.05
        spacing: height * 0.02
        anchors.topMargin: parent.height * 0.05
        anchors.top: parent.top
        anchors.bottom: mapNavigationBar.top
    }

    MapNavigationBar {
        id: mapNavigationBar
        height: parent.height * 0.15
        anchors.bottomMargin: parent.height * 0.05
        anchors.rightMargin: parent.width * 0.05
        anchors.leftMargin: parent.width * 0.05
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        onSearchButtonClicked: {
            __root.state = "searchDrawerOpen"
            searchDrawer.state = ""
        }
    }

    Rectangle {
        id: rectangle
        color: "#00000000"
        visible: false
        anchors.fill: parent

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                __root.state = ""
            }
        }
    }

    SearchDrawer {
        id: searchDrawer
        x: - width
        width: parent.width/2
        visible: false
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        onOpenSearch: {
            __root.state = "searchDrawerSearchActive"
        }
        onCloseSearch: {
            __root.state = "searchDrawerOpen"
        }
        onCloseDrawer: {
            __root.state = ""
        }
    }



    states: [
        State {
            name: "mapControlsVisible"

            PropertyChanges {
                target: mapControls
                x: parent.width * 0.055
            }

            PropertyChanges {
                target: searchDrawer
                visible: false
            }
        },
        State {
            name: "searchDrawerOpen"
            when: mapNavigationBar.searchButtonClicked
            PropertyChanges {
                target: searchDrawer
                x: 0
                visible: true
            }

            PropertyChanges {
                target: rectangle
                color: "#a6000000"
                visible: true
            }
        },
        State {
            name: "searchDrawerSearchActive"
            PropertyChanges {
                target: searchDrawer
                x: 0
                width: parent.width
                visible: true
            }

            PropertyChanges {
                target: rectangle
                color: "#a6000000"
                visible: true
            }
        }
    ]

    transitions: [
        Transition {
            to: "searchDrawerOpen"
            reversible: true
            SequentialAnimation {
                PropertyAction {
                    property: "visible"
                    value: true
                }
                ColorAnimation { }
            }
            NumberAnimation { property: "x"; easing.type: Easing.InOutQuad; }
            PropertyAnimation { property: "visible"; }
        },

        Transition {
            from:"searchDrawerSearchActive"
            to: ""
            NumberAnimation { property: "x"; easing.type: Easing.InOutQuad; }
            SequentialAnimation {
                ColorAnimation { }
                PropertyAction {
                    property: "visible"
                    value: true
                }
            }
        },
        Transition {
            from: "searchDrawerOpen"
            to: "searchDrawerSearchActive"
            reversible: true
            NumberAnimation { property: "width"; easing.type: Easing.InOutQuad; }
        },

        Transition {
            from: ""
            to: "mapControlsVisible"
            reversible: true
            NumberAnimation { property: "x"; easing.type: Easing.InOutQuad; }
        }
    ]
}






















/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:8;anchors_y:109}D{i:18;anchors_height:200;anchors_width:200}
D{i:4;anchors_x:196}D{i:6;anchors_height:100;anchors_width:100}D{i:5;anchors_width:200}
}
 ##^##*/
