import 'dart:io';

import 'package:cupertino_base/widget_popover.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';

class LayoutPartCentral extends StatefulWidget {
  const LayoutPartCentral({super.key});

  @override
  LayoutPartCentralState createState() => LayoutPartCentralState();
}

class LayoutPartCentralState extends State<LayoutPartCentral> {
  @override
  Widget build(BuildContext context) {
    Color selectedColor = Colors.black; // Inicialízala con un valor por defecto
    AppData appData = Provider.of<AppData>(context);
    GlobalKey _settingsButtonKey = GlobalKey();

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          children: [
            CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: appData.toggleSidebarLeft,
              child: Icon(
                CupertinoIcons.sidebar_left,
                color: appData.isSidebarLeftVisible
                    ? CupertinoColors.activeBlue
                    : CupertinoColors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
            const Spacer(),
            CupertinoButton(
              key: _settingsButtonKey,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                WidgetPopover.showPopover(
                  context: context,
                  key: _settingsButtonKey,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            appData.setSelectedColor(
                                Colors.black); // Cambia el color aquí
                            WidgetPopover.hidePopover();
                          },
                          child: Text('Negre'),
                        ),
                        GestureDetector(
                          onTap: () {
                            appData.setSelectedColor(
                                Colors.red); // Cambia el color aquí
                            WidgetPopover.hidePopover();
                          },
                          child: Text('Vermell'),
                        ),
                        GestureDetector(
                          onTap: () {
                            appData.setSelectedColor(
                                Colors.green); // Cambia el color aquí
                            WidgetPopover.hidePopover();
                          },
                          child: Text('Verd'),
                        ),
                        GestureDetector(
                          onTap: () {
                            appData.setSelectedColor(
                                Colors.blue); // Cambia el color aquí
                            WidgetPopover.hidePopover();
                          },
                          child: Text('Blau'),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: const Icon(
                CupertinoIcons.settings,
                size: 24.0,
                semanticLabel: 'Texto para anunciar en modos de accesibilidad',
              ),
            ),
            const Spacer(),
          ],
        ),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(0.0),
          onPressed: appData.toggleSidebarRight,
          child: Icon(
            CupertinoIcons.sidebar_right,
            color: appData.isSidebarRightVisible
                ? CupertinoColors.activeBlue
                : CupertinoColors.black,
            size: 24.0,
            semanticLabel: 'Text to announce in accessibility modes',
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Central",
              style: TextStyle(color: appData.selectedColor),
            ),
          ],
        ),
      ),
    );
  }
}
