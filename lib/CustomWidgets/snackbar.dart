/*
 *  This file is part of Soundal (https://github.com/Sangwan5688/Soundal).
 * 
 * Soundal is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Soundal is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Soundal.  If not, see <http://www.gnu.org/licenses/>.
 * 
 * Copyright (c) 2021-2022, Ankit Sangwan
 */

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:soundal/Helpers/logging.dart';

class ShowSnackBar {
  void showSnackBar(
    BuildContext context,
    String title, {
    SnackBarAction? action,
    Duration duration = const Duration(seconds: 1),
    bool noAction = false,
  }) {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: duration,
          elevation: 6,
          backgroundColor: Colors.grey[900],
          behavior: SnackBarBehavior.floating,
          content: Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
          action: noAction
              ? null
              : action ??
                  SnackBarAction(
                    textColor: Theme.of(context).colorScheme.secondary,
                    label: AppLocalizations.of(context)!.ok,
                    onPressed: () {},
                  ),
        ),
      );
    } catch (e) {
      Logger.root.info('Failed to show Snackbar with title: $title', e);
    }
  }
}
