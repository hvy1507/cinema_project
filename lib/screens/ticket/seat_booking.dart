import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_routes.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/model/seat_booking.dart';
import 'package:flutter_cinema_app/provider/book_ticket.dart';
import 'package:flutter_cinema_app/provider/seat_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/item_date.dart';
import 'package:flutter_cinema_app/widgets/right_button.dart';
import 'package:flutter_cinema_app/widgets/seat_state_widget.dart';
import 'package:provider/provider.dart';


class SeatScreen extends StatefulWidget {
  const SeatScreen({super.key});

  @override
  _SeatScreenState createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SeatProvider>(context, listen: false).resetSeat();
      Provider.of<SeatProvider>(context, listen: false).getChair();
    });
    super.initState();
  }

  int dateSelectedIndex = -1;
  int timeSelectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final seat = Provider.of<SeatProvider>(context);
    const int seatsPerRow = 10; // Số ghế trong mỗi hàng
    final int numRows = (seat.listSeat.length / seatsPerRow).ceil(); // Số hàng cần tạo
    List<List<Seat>> seatRows = [];
    for (int i = 0; i < numRows; i++) {
      int start = i * seatsPerRow;
      int end = start + seatsPerRow;
      if (end > seat.listSeat.length) {
        end = seat.listSeat.length;
      }
      List<Seat> rowSeats = seat.listSeat.sublist(start, end);
      seatRows.add(rowSeats);
    }
    return Consumer<BookTicket>(builder: (context, ticket, child) {
      List<String> dateKeysList = ticket.date.keys.toList();
      List<String> dateValueList = ticket.date.values.toList();
      final seat = Provider.of<SeatProvider>(context);
      return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.5124, 1.0],
              colors: [
                Color.fromRGBO(0, 0, 0, 0.92),
                Color.fromRGBO(44, 19, 92, 1),
                Color.fromRGBO(17, 7, 35, 1)
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Container(
                  margin: const EdgeInsets.only(left: 15),
                  width: 40,
                  height: 40,
                  child: const AppBackButton()),
              title: Text(
                'PVR Cinema',
                style: AppFonts.poppins700(20, Colors.white),
              ),
              actions: const [
                rightButton(
                  icon: AppImages.iconCalendar,
                ),
                SizedBox(
                  width: 22,
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Choose seat',
                        style: AppFonts.poppins400(12, Colors.white),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 35,
                        child: Image.asset(AppImages.imageLine),
                      ),
                      seat.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              itemCount: seat.listSeat.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                int rowIndex = index ~/ 10;
                                Seat newSeat = seatRows[rowIndex][index % 10];
                                return InkWell(
                                    onTap: () {
                                      print('hihi');
                                      if (newSeat.status == 'UNBOOKED') {
                                        seat.selectSeat(newSeat);
                                      } else if (newSeat.status == 'SELECTED') {
                                        seat.unSelectSeat(newSeat);
                                      }
                                    },
                                    child: Container(
                                      child: _getSeat(newSeat.status.toString()),
                                    ));
                              },
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          SeatStateWidget(color: Colors.white, text: 'Available'),
                          SeatStateWidget(color: Color(0xFFB6116B), text: 'Reserved'),
                          SeatStateWidget(color: Color(0xFF09FBD3), text: 'Selected'),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                          height: 50,
                          child: AppButton(
                            titleButton: S.of(context).bookTicket,
                            onTap: () async {
                              if (dateSelectedIndex == -1 || timeSelectedIndex == -1) {
                                showMyDialog(
                                  context,
                                  title: 'Thông báo !',
                                  content: 'Bạn chưa chọn ngày giờ xem phim',
                                  noButton: false,
                                  buttonOneText: 'Chọn ngày giờ',
                                );
                              } else if (seat.selectedSeats.isEmpty) {
                                showMyDialog(context,
                                    title: 'Thông báo!',
                                    content: 'Bạn chưa chọn ghế',
                                    noButton: false,
                                    buttonOneText: 'Đặt ghế ngay');
                              } else {
                                seat.bookSeats();
                                final refresh = await Navigator.pushNamed(
                                    context, AppRoutes.paymentScreen);
                                if (refresh == true) {
                                  seat.getChair();
                                }
                              }
                            },
                          )),
                    ]),
              ),
            ),
          ));
    });
  }

  Widget _getSeat(String status) {
    switch (status) {
      case 'UNBOOKED':
        return Container(
            width: 30,
            height: 25,
            margin: const EdgeInsets.all(10),
            child: Image.asset(AppImages.iconUnbookedSeat));
      case 'SELECTED':
        return Container(
            width: 30,
            height: 25,
            margin: const EdgeInsets.all(10),
            child: Image.asset(AppImages.iconBookingSeat));
      case 'BOOKED':
        return Container(
            width: 30,
            height: 25,
            margin: const EdgeInsets.all(10),
            child: Image.asset(AppImages.iconBookedSeat));
      default:
        return Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.all(10),
            child: Image.asset(AppImages.iconUnbookedSeat));
    }
  }
}
