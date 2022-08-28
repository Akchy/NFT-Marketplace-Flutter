import 'package:flutter/material.dart';

PreferredSize appBar(isDarkMode, {backIcon}){
  return PreferredSize(
    preferredSize: const Size.fromHeight(55.0),
    child: AppBar(
      leading: backIcon,
      shadowColor: Colors.transparent,
      backgroundColor: isDarkMode
          ? const Color(0xff06090d)
          : const Color(0xfff8f8f8),
      centerTitle: true,
      title: Text("NFT Market", style: TextStyle(
        color: isDarkMode ? Colors.white : const Color(0xff3b22a1),
      ),),
    ),
  );
}