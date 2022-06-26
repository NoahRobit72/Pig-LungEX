
%  Configure Arduino Settings
serialName = "/dev/cu.usbmodem101";
inPins = {'A5','A4'}; % -- Define data pins, buffersize and baudrate for arduino
baudrate = 9600;
a = serialport(serialName,baudrate);
configureTerminator(a,"CR/LF");% -- Configure terminator to accurately read data
flush(a); % -- Flush arduino to remove any incomplete data strings

subplot(2,1,1)
title('Pressure Sensor')
xlabel('Time (sec)') 
ylabel('Pressure (cm H20)') 
h = animatedline;

% Constant Variables
time = 0;

% Changing Variables
delay = .05;


while(1)
    serialValue = str2num(readline(a));    
    pressureValue = findPressure(serialValue);
%     plotPressure(pressureValue, time);


    addpoints(h,time,pressureValue)
    drawnow

    time = time + delay;
%     pause(delay);
end

% function plotPressure(pressureValue,time)  
%     figure(1)
%     title('Pressure Sensor')
%     h = animatedline;
%     addpoints(h,time,pressureValue)
%     drawnow
% end


function pressureValue = findPressure(serialValue)
    m = .205761;
    b = -105.212;
    pressureValue = (m * serialValue) + b;
end











