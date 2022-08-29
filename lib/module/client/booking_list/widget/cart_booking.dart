import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CartBooking extends StatelessWidget {
  const CartBooking({
    required this.url,
    required this.judul,
    required this.alamat,
    required this.tanggal,
    required this.jmlTiket,
    required this.respon,
    Key? key,
  }) : super(key: key);

  final String url;
  final String judul;
  final String alamat;
  final String tanggal;
  final String jmlTiket;
  final String respon;

  //

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
          ),
          const SizedBox(
            width: 25.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(judul,
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      alamat,
                      maxLines: 3,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.grey,
                      size: 20,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      tanggal,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/icon/ic_ticket.svg',
                      width: 20,
                      height: 20,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      jmlTiket,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      respon,
                      style: GoogleFonts.montserrat(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
