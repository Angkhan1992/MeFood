import 'package:flutter/foundation.dart';
import 'package:mefood/model/model.dart';
import 'package:mefood/util/util.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

const kSocketUrl =
    kDebugMode ? 'ws://192.168.0.253:52526' : 'ws://51.68.185.254:41515';
SocketService? socketService;

class SocketService {
  io.Socket? _socket;
  MemberModel owner;

  SocketService({
    required this.owner,
  }) {
    if (_socket == null) {
      _socket = io.io(
        kSocketUrl,
        io.OptionBuilder()
            .setTransports(["websocket"])
            .disableAutoConnect()
            .build(),
      );
      _socket!.connect();

      _socket!.onConnect((_) {
        logger.d('[SOCKET] connected');
        _socket!.emit(
          'self',
          {'id': owner.id},
        );
      });

      _socket!.onDisconnect((_) {
        logger.d('[SOCKET] disconnect');
      });

      _socket!.onConnectError((data) {
        logger.d('[SOCKET] onConnectError : $data');
      });

      _socket!.onError((data) {
        logger.d('[SOCKET] onError : $data');
      });
    }
  }

  void createOrder(OrderModel order) {
    _socket!.emit('order_create', {'id': order.id});
  }

  factory SocketService.of({
    required MemberModel owner,
  }) {
    return SocketService(owner: owner);
  }

  void onCustomerReceiver({
    Function(dynamic)? onCreateOrder,
  }) {
    _socket!.on('create_order', (value) async {
      logger.d('[Socket] create order: $value');
    });
  }

  void onRestaurantReceiver({
    Function(dynamic)? onCreateOrder,
  }) {
    _socket!.on('create_order', (value) async {
      logger.d('[Socket] create order: $value');
    });
  }

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
