import 'package:boxing/src/models/enums/action_type.dart';
import 'package:flutter/foundation.dart';

enum ActionPhase {
  startup,
  attack,
  endLag,
  idle,
}

class CharacterStatus extends ChangeNotifier {
  int _maxHp;
  int _maxStamina;
  int _maxGp;
  int _currentHp;
  int _currentStamina;
  int _currentGp;
  ActionType _action = ActionType.block;
  double _actionDuration = 0.0;
  ActionPhase _actionPhase = ActionPhase.idle;

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
  ActionPhase get actionPhase => _actionPhase;

  void takeDamage(int hpDamage, int staminaDamage, int blockDamage) {
    _currentHp = (_currentHp - hpDamage).clamp(0, _maxHp);
    _currentStamina = (_currentStamina - staminaDamage).clamp(0, _maxStamina);
    _currentGp = (_currentGp - blockDamage).clamp(0, _maxGp);
    notifyListeners();
  }

  void doAction(ActionType action) {
    _action = action;
    _actionPhase = ActionPhase.startup;
    _actionDuration = action.startupDelay;
  }

  void handleActionDuration(double dt) {
    _actionDuration -= dt;
    if (_actionDuration <= 0) {
      switch (_actionPhase) {
        case ActionPhase.startup:
          _actionPhase = ActionPhase.attack;
          notifyListeners();
          _actionPhase = ActionPhase.endLag;
          break;
        case ActionPhase.endLag:
          _actionPhase = ActionPhase.idle;
          _action = ActionType.block;
          _actionDuration = 0.0;
          break;
        default:
          break;
      }
    }
  }
}
