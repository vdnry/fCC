function isPrime(n) {
    if (n == 2) return true
    if (n == 1 || n % 2 == 0) return false;
    for (let i = 3; i <= n ** 0.5; i++) {
        if (n % i == 0) return false;
    }
    return true;
}
module.exports = {
    isPrime
}