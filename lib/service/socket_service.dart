import 'package:socket_io_client/socket_io_client.dart' as io;

SocketService? socketService;

class SocketService {
  io.Socket? _socket;
  // UserModel? _owner;

  // SocketProvider();

  // void init(UserModel user) {
  //   if (_socket == null) {
  //     _owner = user;
  //     _socket = io.io(
  //       kSocketUrl,
  //       io.OptionBuilder()
  //           .setTransports(["websocket"])
  //           .disableAutoConnect()
  //           .build(),
  //     );
  //     _socket!.connect();

  //     _socket!.onConnect((_) {
  //       if (kDebugMode) {
  //         print('[SOCKET] connected');
  //       }
  //       _socket!.emit(
  //         'self',
  //         {
  //           'user_id': 'user${_owner!.id}',
  //           'name': _owner!.usrName,
  //         },
  //       );
  //     });

  //     _socket!.onDisconnect((_) {
  //       if (kDebugMode) {
  //         print('[SOCKET] disconnect');
  //       }
  //     });

  //     _socket!.onConnectError((data) {
  //       if (kDebugMode) {
  //         print('[SOCKET] onConnectError : $data');
  //       }
  //     });

  //     _socket!.onError((data) {
  //       if (kDebugMode) {
  //         print('[SOCKET] onError : $data');
  //       }
  //     });

  //     _socket!.on("notification", (value) {
  //       if (kDebugMode) {
  //         print("[SOCKET] receive notification ===> ${value.toString()}");
  //         String title = 'Invited Friend';
  //         String name = value['title'];
  //         String description = '$name just sent a friend request.';
  //         switch (value['id']) {
  //           case 'invite_user':
  //             title = 'Invited';
  //             description = '$name just sent a friend request.';
  //             break;
  //           case 'accept_user':
  //             title = 'Accepted';
  //             description = '$name just accepted your friend request.';
  //             break;
  //           case 'decline_user':
  //             title = 'Declined';
  //             description = '$name just decline your friend request.';
  //             break;
  //           case 'create_room':
  //             title = 'Create Room';
  //             description = '$name was just created from your friend.';
  //             break;
  //         }
  //         NotificationProvider.showNotification(
  //           title: title,
  //           description: description,
  //           type: NotificationProvider.keyMessageChannel,
  //         );
  //       }
  //     });
  //   }
  // }

  // void updateRoomList({
  //   Function(dynamic)? update,
  // }) {
  //   _socket!.on("room_list", (value) async {
  //     if (kDebugMode) {
  //       print("[Room List] update ===> ${value.toString()}");
  //     }
  //     update!(value);
  //   });
  // }

  // void updateFriend({
  //   Function(dynamic)? update,
  // }) {
  //   _socket!.on("friend", (value) async {
  //     if (kDebugMode) {
  //       print("[Friend] update ===> ${value.toString()}");
  //     }
  //     update!(value);
  //   });
  // }

  // void inviteFriend(String senderID, String receiverID) {
  //   _socket!.emit(
  //     'invite_friend',
  //     {
  //       'senderid': 'user$senderID',
  //       'receiverid': 'user$receiverID',
  //     },
  //   );
  // }

  // void acceptFriend(String senderID, String receiverID) {
  //   _socket!.emit(
  //     'accept_friend',
  //     {
  //       'senderid': 'user$senderID',
  //       'receiverid': 'user$receiverID',
  //     },
  //   );
  // }

  // void declineFriend(String senderID, String receiverID) {
  //   _socket!.emit(
  //     'decline_friend',
  //     {
  //       'senderid': 'user$senderID',
  //       'receiverid': 'user$receiverID',
  //     },
  //   );
  // }

  // void notiRoom(RoomModel room, String userid) {
  //   _socket!.emit(
  //     'noti_room',
  //     {
  //       'roomid': 'room${room.id}',
  //       'userid': 'user$userid',
  //     },
  //   );
  // }

  // void updateRoomStatus(RoomModel room, String status) {
  //   _socket!.emit(
  //     'update_room',
  //     {
  //       'roomid': 'room${room.id}',
  //       'status': status,
  //     },
  //   );
  // }

  // void createRoom(RoomModel room, UserModel user) {
  //   _socket!.emit(
  //     'create_room',
  //     {
  //       'room': {
  //         'id': 'room${room.id}',
  //         'name': room.name,
  //       },
  //       'userid': 'user${user.id}',
  //     },
  //   );
  // }

  // void updateRoom(
  //   RoomModel room,
  //   UserModel user, {
  //   Function(dynamic)? update,
  // }) {
  //   _socket!.on('update_room', (value) async {
  //     if (kDebugMode) {
  //       print("[Join Room] update ===> ${value.toString()}");
  //     }
  //     update!(value);
  //   });
  // }

  // void joinRoom(RoomModel room, UserModel user) {
  //   _socket!.emit(
  //     'join_room',
  //     {
  //       'roomid': 'room${room.id}',
  //       'userid': 'user${user.id}',
  //     },
  //   );
  // }

  // void leaveRoom(RoomModel room, UserModel user) {
  //   _socket!.emit(
  //     'leave_room',
  //     {
  //       'roomid': 'room${room.id}',
  //       'userid': 'user${user.id}',
  //     },
  //   );
  // }

  // void roomData(RoomModel room) {
  //   _socket!.emit(
  //     'room_data',
  //     {
  //       'roomid': 'room${room.id}',
  //       'data': room.getRoomData(),
  //     },
  //   );
  // }

  io.Socket? getSocket() {
    return _socket!;
  }
}
