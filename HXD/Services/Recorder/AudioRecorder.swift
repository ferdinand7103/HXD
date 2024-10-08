//
//  Recorder.swift
//  HXD
//
//  Created by Vincent Junior Halim on 14/08/24.
//

import Foundation
import AVFoundation


class AudioRecorder: NSObject , ObservableObject , AVAudioPlayerDelegate  {
    static let instance = AudioRecorder()
    
    private var audioRecorder : AVAudioRecorder!
    private var audioPlayer : AVAudioPlayer!
    private var session : AVAudioSession! = AVAudioSession.sharedInstance()
    
    func startRecording(){
        let options = [
            AVAudioSession.CategoryOptions.defaultToSpeaker,
            AVAudioSession.CategoryOptions.duckOthers,
            AVAudioSession.CategoryOptions.interruptSpokenAudioAndMixWithOthers
        ]
        
        do {
            try session.setCategory(.playAndRecord, mode: .spokenAudio, options: AVAudioSession.CategoryOptions(options))
            try session.setActive(true, options: .notifyOthersOnDeactivation)
        } catch let error {
            fatalError("Can not setup the Recording: \(error.localizedDescription)")
        }
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName = path.appendingPathComponent("recording.wav")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatLinearPCM),
            AVSampleRateKey: 44100,
            AVNumberOfChannelsKey: 1,
            AVLinearPCMBitDepthKey: 16,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        
        do {
            audioRecorder = try AVAudioRecorder(url: fileName, settings: settings)
            audioRecorder.prepareToRecord()
            audioRecorder.record()
            print(audioRecorder.url)
        } catch let error {
            fatalError("Failed to Setup the Recording: \(error.localizedDescription)")
        }
    }
    
    
    func stopRecording(){
        audioRecorder.stop()
        do {
            try session.setActive(false)
        } catch _ {
        }
    }
    func playSound(speak: String) {
        do {
            let folderURL = Bundle.main.url(forResource: speak, withExtension: ".m4a")!
            audioPlayer = try AVAudioPlayer(contentsOf: folderURL)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
            print("Playing sound.")
        } catch let error {
            print("Error initializing audio player: \(error.localizedDescription)")
        }
    }
}
    
    
