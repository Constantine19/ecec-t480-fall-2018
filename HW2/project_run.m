x = linspace(0, 100);

y = 50 * log(exp(1) + -2*((x/100).^2) + (3 - exp(1))*((x/100).^3));

y2 = 0.2 * (x.^2) / (2 * 9.8);

plot(x, y)
hold on
plot(x, 2*y)
plot(2*x, y)
plot(x, y2)
xlabel("Volumetric Flow Rate (m^3/s)")
ylabel("Head (m)")
