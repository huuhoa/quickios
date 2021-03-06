/* SegmentedControl implements the UISegmentedControl in QML way.

  The limitation:

  1. It don't support to modify the detailed style yet.
     Only tintColor is supported

  2. It can't use image as the tab icon.

 */
import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQml.Models 2.1
import QtQuick.Controls 1.2 as QuickControl
import "./priv"
import "./def"

Item {
    id: segmentedControl

    default property alias __children : tabView.children
    property color tintColor : parent && parent.tintColor ? parent.tintColor : Constant.tintColor
    property alias count : tabView.count
    property alias currentIndex : tabView.currentIndex
    property alias numberOfSegments : tabView.count
    property alias selectedSegmentIndex : tabView.currentIndex

    property color barTintColor : "#ffffff"

    /// Return the item segmented view at index.
    function itemAt(index) {
        return tabView.getTab(index).children[0];
    }

    TabView {
        id: tabView
        anchors.fill: parent

        style: SegmentedControlTabViewStyle {
            id: tabViewStyle
            tintColor : segmentedControl.tintColor
            backgroundColor : barTintColor
        }

        onCurrentIndexChanged: {
            var tab = getTab(currentIndex);
            tab.tintColor = segmentedControl.tintColor;
        }

        Component.onCompleted: {
            var tab = getTab(currentIndex);
            tab.tintColor = segmentedControl.tintColor;
        }
    }


}
