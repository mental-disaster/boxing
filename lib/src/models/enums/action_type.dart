enum ActionType {
  block,
  // 공격적 회피
  // 낮은 스테소모, 낮은 무적시간, 낮은 행동시간, 이어지는 공격에 보너스 효과
  weave,
  // 방어적 회피
  // 중간 스테소모, 높은 무적시간, 높은 행동시간, 회피 실패 리스트 감소 효과
  duck,
  // 스테소모 아주 낮음, 체력뎀 낮음, 스테뎀 아주 낮음, 가드뎀 아주 낮음, 관통뎀 없음, 선딜 낮음, 후딜 낮음
  jab,
  // 스테소모 중간, 체력뎀 중간, 스테뎀 중간, 가드뎀 중간, 관통뎀 낮음, 선딜 중간, 후딜 중간, 잽 스트레이트 어퍼 행동 중 스트레이트 피격시 행동 취소
  straight,
  // 스테소모 중간, 체력뎀 중간 - 스트보다 낮음, 스테뎀 중간 - 스트보다 높음, 가드뎀 높음, 관통뎀 높음, 선딜 중간 - 스트보다 김, 후딜 중간, 다른 공격 행동 중 훅 피격시 행동 취소
  hook,
  // 스테소모 높음, 체력뎀 높음, 스테뎀 낮음, 가드뎀 아주 낮음, 관통뎀 없음, 선딜 높음, 후딜 높음, 다른 공격 행동 중 어퍼 피격시 행동 취소
  uppercut,
  hit,
}

extension ActionConfig on ActionType {
  double get startupDelay {
    switch (this) {
      case ActionType.jab:
        return 1.0;
      default:
        return 0.0;
    }
  }

  double get endLag {
    switch (this) {
      case ActionType.jab:
        return 1.0;
      default:
        return 0.0;
    }
  }
}
