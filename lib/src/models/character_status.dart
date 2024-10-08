import 'package:boxing/src/models/enums/action_type.dart';
import 'package:flutter/foundation.dart';

class CharacterStatus extends ChangeNotifier {
  int _maxHp;
  int _maxStamina;
  int _maxGp;
  int _currentHp;
  int _currentStamina;
  int _currentGp;
  ActionType _action = ActionType.block;
  double _actionDuration = 0.0;

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
  ActionType get action => _action;

  void takeDamage(int hpDamage, int staminaDamage, int blockDamage) {
    _currentHp = (_currentHp - hpDamage).clamp(0, _maxHp);
    _currentStamina = (_currentStamina - staminaDamage).clamp(0, _maxStamina);
    _currentGp = (_currentGp - blockDamage).clamp(0, _maxGp);
    notifyListeners();
  }

  void doAction(ActionType action, double duration) {
    _action = action;
    _actionDuration = duration;
  }

  void handleActionDuration(double dt) {
    _actionDuration -= dt;
    if (_actionDuration <= 0) {
      _action = ActionType.block;
    }
  }
}
