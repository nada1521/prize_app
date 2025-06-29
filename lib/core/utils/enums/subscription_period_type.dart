enum SubscriptionPeriodType {
  monthly,
  yearly;

  bool get isMonthly => this == SubscriptionPeriodType.monthly;

  bool get isYearly => this == SubscriptionPeriodType.yearly;

  static SubscriptionPeriodType fromString(String value) {
    switch (value.toLowerCase()) {
      case "monthly":
        return SubscriptionPeriodType.monthly;
      case "yearly":
        return SubscriptionPeriodType.yearly;
      default:
        return SubscriptionPeriodType.monthly;
    }
  }
}
