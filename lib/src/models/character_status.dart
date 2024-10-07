import 'package:boxing/src/models/enums/action_type.dart';
import 'package:flutter/foundation.dart';

class CharacterStatus extends ChangeNotifier {
  int _maxHp;
  int _maxStamina;
  int _maxGp;
  int _currentHp;
  int _currentStamina;
  int _currentGp;
  double _actionDuration = 0;
  ActionType _action = ActionType.block;

  CharacterStatus(
      this._maxHp,
      this._maxStamina,
      this._maxGp,
      this._currentHp,
      this._currentStamina,
      this._currentGp,
      );

  int get maxHp => _maxHp;
  int get maxStamina => _maxStamina;
  int get maxGp => _maxGp;
  int get currentHp => _currentHp;
  int get currentStamina => _currentStamina;
  int get currentGp => _currentGp;
  double get actionDuration => _actionDuration;
  ActionType get action => _action;

  void takeDamage(int hpDamage, int staminaDamage, int blockDamage) {
    _currentHp = (_currentHp - hpDamage).clamp(0, _maxHp);
    _currentStamina = (_currentStamina - staminaDamage).clamp(0, _maxStamina);
    _currentGp = (_currentGp - blockDamage).clamp(0, _maxGp);
    notifyListeners();
  }

  void doAction(ActionType action, bool isCancel) {
    _action = action;
    _actionDuration = action.duration;
    print(DateTime.now());
    print('action');
  }

  void timeSpend(double dt) {
    _actionDuration -= dt;
    if (_actionDuration <= 0) {
      _action = ActionType.block;
      print(DateTime.now());
      print('action finished');
    }
  }
}