import 'package:flutter/material.dart';
import 'package:or_en_pepite/src/models/models.dart';

class SocialLoginButton extends StatelessWidget {
  final SocialButtons button;
  const SocialLoginButton({super.key, required this.button});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: button.loginMethod(),
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
            color: button.bgColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: button.icon,
              ),
              const SizedBox(width: 10),
              Text(
                button.text,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: button.txtColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
