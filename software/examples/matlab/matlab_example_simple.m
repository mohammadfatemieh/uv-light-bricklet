function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletUVLight;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change to your UID

    ipcon = IPConnection(); % Create IP connection
    uvl = handle(BrickletUVLight(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current UV light (unit is µW/cm²)
    uvLight = uvl.getUVLight();
    fprintf('UV Light: %i µW/cm²\n', uvLight);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
