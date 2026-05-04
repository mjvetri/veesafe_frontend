enum OrderMode { buy, rent }

enum RentalDuration { daily, weekly, monthly }

class RentalInfo {
  final OrderMode mode;
  final RentalDuration? duration;
  final int durationCount;
  final double securityDeposit;

  const RentalInfo({
    this.mode = OrderMode.buy,
    this.duration,
    this.durationCount = 1,
    this.securityDeposit = 0,
  });

  double rentalPrice(double basePrice) {
    switch (duration) {
      case RentalDuration.daily:   return basePrice * 0.05 * durationCount;
      case RentalDuration.weekly:  return basePrice * 0.25 * durationCount;
      case RentalDuration.monthly: return basePrice * 0.60 * durationCount;
      default: return basePrice;
    }
  }
}