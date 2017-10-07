//
//  ViewController.swift
//  Playlist
//
//  Created by Marc Hosecloth on 4/20/17.
//  Copyright © 2017 Marc Hosecloth. All rights reserved.
//

import UIKit
import CoreData
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var playlistTableView: UITableView!
    @IBOutlet weak var addTrackButton: UIButton!
    @IBOutlet weak var trackPickerView: UIPickerView!
    
    var playlist : [String] = []
    
    var selectedTrack : String = ""
    
    let lemonadeTracks = ["Pray You Catch Me", "Hold Up", "Don't Hurt Yourself", "Sorry", "6 Inch", "Daddy Lessons", "Love Drought", "Sandcastles", "Forward", "Freedom", "All Night", "Formation"]
    
    let lemonadePaths = ["01 - Pray You Catch Me", "02 - Hold Up", "03 - Don't Hurt Yourself", "04 - Sorry", "05 - 6 Inch", "06 - Daddy Lessons", "07 - Love Drought", "08 - Sandcastles", "09 - Forward", "10 - Freedom", "11 - All Night", "12 - Formation"]
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadAudioFiles()
        
        trackPickerView.delegate = self
        trackPickerView.dataSource = self
        
        trackPickerView.isHidden = true
    }
    
    func loadAudioFiles() {
        for trackNumber in 0..<lemonadeTracks.count {
            let trackMapping : TrackMapping = NSEntityDescription.insertNewObject(forEntityName: "TrackMapping", into: DatabaseController.getContext()) as! TrackMapping
            
            trackMapping.name = lemonadeTracks[trackNumber]
            trackMapping.path = lemonadePaths[trackNumber]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playlistTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrackTableViewCell
        
        cell.trackLabel.text = playlist[indexPath.row]
        cell.playTrackButton.addTarget(self, action: #selector(self.playTrack), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        playlistTableView.visibleCells[indexPath.row].isSelected = false
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            deleteTrack(index: indexPath.row)
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lemonadeTracks.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lemonadeTracks[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedTrack = lemonadeTracks[row]
    }
    
    @IBAction func addTrackButtonClicked(_ sender: UIButton) {
        if addTrackButton.currentTitle == "Add Track" {
            addTrackButton.setTitle("Done", for: .normal)
            trackPickerView.isHidden = false
            return
        }
        
        if addTrackButton.currentTitle == "Done" {
            addTrackButton.setTitle("Add Track", for: .normal)
            addTrack()
            trackPickerView.isHidden = true
        }
    }
    
    func addTrack() {
        if selectedTrack.isEmpty {  // user didn't move picker but wants to add first track
            selectedTrack = lemonadeTracks[0]
        }
        
        playlist.append(selectedTrack)
        
        playlistTableView.beginUpdates()
        playlistTableView.insertRows(at: [IndexPath(row: playlist.count-1, section: 0)], with: .automatic)
        playlistTableView.endUpdates()
        
        updatePlayButtonTags()
    }
    
    func deleteTrack(index: Int) {
        if audioPlayer.isPlaying {
            audioPlayer.stop()
        }
        
        playlist.remove(at: index)
        
        playlistTableView.beginUpdates()
        playlistTableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
        playlistTableView.endUpdates()
        
        updatePlayButtonTags()
    }
    
    func updatePlayButtonTags() {
        var tagNumber : Int = 1
        
        for cell in playlistTableView.visibleCells {
            if let trackCell = cell as? TrackTableViewCell {
                trackCell.playTrackButton.tag = tagNumber
                tagNumber += 1
            }
        }
    }
    
    @IBAction func playTrack(sender: UIButton) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: getTrackPath(trackName: getTrackName(tag: sender.tag)), ofType: "mp3")!))
            
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            
        } catch {
            print(error)
        }
    }
    
    func getTrackPath(trackName: String) -> String {
        var trackPath : String = ""
        
        let fetchRequest : NSFetchRequest<TrackMapping> = TrackMapping.fetchRequest()
        
        do {
            let searchResults = try DatabaseController.getContext().fetch(fetchRequest)
            
            for trackMapping in searchResults as [TrackMapping] {
                if trackName == trackMapping.name {
                    trackPath = trackMapping.path!
                }
            }
        } catch {
            print(error)
        }
        
        if trackPath.isEmpty {
            return "NULL (Track Path)"
        }
        
        return trackPath
    }
    
    func getTrackName(tag: Int) -> String {
        var trackName : String = ""
        
        for cell in playlistTableView.visibleCells {
            if let trackCell = cell as? TrackTableViewCell {
                if tag == trackCell.playTrackButton.tag {
                    trackName = trackCell.trackLabel.text!
                }
            }
        }
        
        if trackName.isEmpty {
            return "NULL (Track Name)"
        }
        
        return trackName
    }

    @IBAction func pauseTrackButtonClicked(_ sender: UIButton) {
        if playlist.count == 0 {    // no tracks in playlist
            return
        } else {
            if audioPlayer.isPlaying {
                audioPlayer.pause()
            }
        }
    }

    @IBAction func restartTrackButtonClicked(_ sender: UIButton) {
        if playlist.count == 0 {    // no tracks in playlist
            return
        } else {
            if audioPlayer.isPlaying {
                audioPlayer.currentTime = 0
            }
            audioPlayer.play()
        }
    }
}

