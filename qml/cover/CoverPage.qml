import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: label
        anchors.centerIn: parent
        text:  ""
        //player.isPlaying ? player.currentIndexSt :
    }

    CoverActionList {
        id: activecover
            enabled: player.isPlaying || player.isPaused
            CoverAction {
                iconSource: "image://theme/icon-cover-previous-song"
                onTriggered: {
                    if (player.currentIndex > 0) {
                        player.prev()
                    if (!player.isPlaying) {
                        player.play()
                    }
                    }
                }
            }

            CoverAction {
                iconSource: player.isPlaying ? "image://theme/icon-cover-pause" : "image://theme/icon-cover-play"
                onTriggered: {
                        if (player.isPlaying) {
                            player.pause()

                        } else {
                            player.play()
                        }
                }
            }

            CoverAction {
                iconSource: "image://theme/icon-cover-next-song"
                onTriggered: {

                    if (player.currentIndex < player.size-1) {
                        player.next()
                    if (!player.isPlaying) {
                        player.play()
                    }
                 } else {
                    yamussdk.audios.get(player.queue)
                    }
                }
            }


        }
    Connections {
        target: yamussdk
        onGotUserAudios: {

            player.setPlaylist(audios, -1)
        }

    }
}