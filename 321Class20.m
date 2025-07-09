[chirp, FS] = audioread('Class22Chirp.wav')

[S,faxis,taxis] = spectrogram(chirp,hamming(256),Noverlap,FS


plot(faxis,taxis)
