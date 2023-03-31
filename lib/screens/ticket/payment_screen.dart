
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/network/api_request.dart';
import 'package:flutter_cinema_app/network/apibase/api_response.dart';
import 'package:flutter_cinema_app/provider/book_ticket.dart';
import 'package:flutter_cinema_app/provider/seat_provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/back_button.dart';
import 'package:flutter_cinema_app/widgets/price_detail.dart';
import 'package:flutter_cinema_app/widgets/right_button.dart';
import 'package:flutter_cinema_app/widgets/seat_state_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {

  @override
  Widget build(BuildContext context) {
    String monthName = DateFormat('MMMM').format(DateTime.now()).substring(0, 3);
    String yearName = DateFormat('yyyy').format(DateTime.now());
    final seat = Provider.of<SeatProvider>(context);

    return Consumer<BookTicket>(builder: (context, ticketInfo, child) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: 10,
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
          actions:  const [
            rightButton(
              icon: AppImages.iconCalendar,
            ),
            SizedBox(
              width: 22,
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 1 / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(0, 0, 0, 0.92),
                      Color.fromRGBO(44, 19, 92, 1),
                      Color.fromRGBO(17, 7, 35, 1)
                    ],
                    stops: [
                      0,
                      0.2516,
                      0.8646,
                    ],
                    transform: GradientRotation(
                        180.18 * (3.141592 / 180)), // chuyển đổi độ sang radian
                  ),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(AppImages.imagePaymentBg))),
              child: Consumer<SeatProvider>(
                builder: (context, seat, child) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(top: kToolbarHeight),
                          child: Text('Order Summary',
                              style: AppFonts.poppins400(12, Colors.white))),
                      Text(
                        'DOCTOR  STRANGE  IN  THE\nMULTIVERSE  OF  MADNESS (U/A) ',
                        textAlign: TextAlign.center,
                        style: AppFonts.poppins600(18, Colors.white),
                      ),
                      Column(
                        children: [
                          const SeatStateWidget(image: AppImages.iconClock, text: '2h10'),
                          const SeatStateWidget(
                              image: AppImages.icon3D, text: 'English 3D'),
                          SeatStateWidget(
                              image: AppImages.iconCalendar,
                              text: monthName +
                                  ' ' +
                                  ticketInfo.datePicked +
                                  ' , ' +
                                  yearName +
                                  ' | ' +
                                  ticketInfo.timePicked),
                          const SeatStateWidget(
                              image: AppImages.iconLocation,
                              text: 'PVR VR Mall, Anna Nagar'),
                          SeatStateWidget(
                              image: AppImages.iconSeat,
                              text: seat.selectedSeats.length.toString() +
                                  ' ' +
                                  'Seats selected'),
                          SeatStateWidget(
                              image: AppImages.iconTicket,
                              text: 'Seat' + ' ' + seat.selectingSeat.join(', ')),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
              height: MediaQuery.of(context).size.height * 1 / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.2),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AppImages.imagePaymentLinearBg))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Price detail',
                        style: AppFonts.poppins400(
                            12, const Color(0xFFFFFFA6).withOpacity(0.65)),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 12,
                        width: 7,
                        child: Image.asset(AppImages.iconUp),
                      )
                    ],
                  ),
                  Text(
                    'Ticket Subtotal',
                    style: AppFonts.poppins600(15, Colors.white),
                  ),
                  PriceDetail(
                      textOne: seat.selectedSeats.length.toString() +
                          ' ' +
                          'Ticket(s)' +
                          ' ' +
                          '@246.45/ticket',
                      moneySign: true,
                      price: seat.totalPrice.toString()),
                  const PriceDetail(
                    textOne: 'food & beverages',
                    price: '85',
                    moneySign: true,
                  ),
                  const PriceDetail(
                    textOne: 'Parking charges',
                    price: '40',
                    moneySign: true,
                  ),
                  Text(
                    'Fee & Tax ',
                    style: AppFonts.poppins600(15, Colors.white),
                  ),
                  const PriceDetail(textOne: 'Booking Charge', price: '58'),
                  const PriceDetail(
                      textOne: 'Central Goods and Service Tax', price: '5.22'),
                  const PriceDetail(
                      textOne: 'State Goods and Service Tax', price: '5.22'),
                  const PriceDetail(textOne: 'PG Fee', price: '5.22'),
                  const SizedBox(
                    height: 10,
                  ),
                  const PriceDetail(
                    textOne: 'Total',
                    price: '100.000',
                    moneySign: true,
                    isBoldText: true,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 47,
                    child: AppButton(
                      titleButton: 'Proceed to Payment',
                      onTap: () async{
                        ApiResponse res = await ApiRequest.book(seat.id, seat.listChairID);
                          seat.resetSeat();
                          Navigator.pop(context, true);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
