import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustumIconsApp extends StatelessWidget {
  const CustumIconsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
                        onTap: () {
                          
                        },
                        child: Container(
                          height: 56.h,
                          width: 90.w,
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(color: Color(0xffC7C4D8))),
                          child: Center(child: SvgPicture.asset('assets/icons/google_icon.svg', height: 24.h, width:12.w )),
                        
                        ),
                      );
  }
}