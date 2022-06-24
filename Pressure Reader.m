
%  Configure Arduino Settings
serialName = "/dev/cu.usbmodem101";
inPins = {'A5','A4'}; % -- Define data pins, buffersize and baudrate for arduino
baudrate = 9600;
a = serialport(serialName,baudrate);
configureTerminator(a,"CR/LF");% -- Configure terminator to accurately read data
flush(a); % -- Flush arduino to remove any incomplete data strings

%   Variables for  Bit to cmH20 conversion
m = .205761;
b = -105.212;

while(1)
    pressureResult = str2num(readline(a));
    cmH20 = (m * pressureResult) + b;
    disp(cmH20);
end






