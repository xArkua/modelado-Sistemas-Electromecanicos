function motorDC_ode45()
    Ra = 2;
    La = 0.023;
    Ke = 0.01;
    Kt = 0.01;
    Jm = 0.001;
    b = 0.0012;
    Va = 5;

    x0 = [0; 0; 0];

    tspan = [0 10];

    [t, x] = ode45(@(t, x) motorDC_eqs(t, x, Va, Ra, La, Ke, Kt, Jm, b), tspan, x0);

    subplot(1, 1, 1);
    plot(t, x(:, 3));
    xlabel('Tiempo');
    ylabel('Velocidad');
    title('Velocidad');
end

function dxdt = motorDC_eqs(~, x, Va, Ra, La, Ke, Kt, Jm, b)
    ia = x(1);
    omega = x(3);

    dxdt = zeros(3, 1);
    dxdt(1) = (1 / La) * (Va - Ra * ia - Ke * omega);
    dxdt(2) = omega;
    dxdt(3) = (1 / Jm) * (Kt * ia - b * omega);
end