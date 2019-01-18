//
//  ViewController.swift
//  ZooMap
//
//  Created by Caroline Port on 10/3/18.
//  Copyright © 2018 Caroline Port. All rights reserved.
//
//importing the necessary functional tools
import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var annotationView = MKMarkerAnnotationView()
        guard let annotation = annotation as? Exhibits else {return nil}
        var identifier = ""
        var color = UIColor.red
        switch annotation.type{                 //creates the ability to change the colors based upon a variable in each exhibits code, the type
        case .redRocks:
            identifier = "Red Rocks"
            color = .red
        case .riversEdge:
            identifier = "River's Edge"
            color = .brown
        case .discoveryCorner:
            identifier = "Discovery Corner"
            color = .blue
        case .theWild:
            identifier = "The Wild"
            color = .purple
        case .historicHill:
            identifier = "Historic Hill"
            color = .green
        case .lakesideCrossing:
            identifier = "Lakeside Crossing"
            color = .yellow
        default:                      // creates a default in case none of the exhibits meet the types listed
            color = .white
        }
        if let dequedView = mapView.dequeueReusableAnnotationView(
            withIdentifier: identifier)
            as? MKMarkerAnnotationView {
            annotationView = dequedView
        } else{
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        }
        annotationView.markerTintColor = color
        annotationView.clusteringIdentifier = identifier
        return annotationView
    }
  
    override func viewDidLoad(){
        
        super.viewDidLoad()
        //map types
        mapView.mapType = MKMapType.standard;
        mapView.mapType = MKMapType.satellite;
        mapView.mapType = MKMapType.hybrid;
       
       
        // set initial location in St. Louis Zoo
        let initialLocation = CLLocation(latitude: 38.635939, longitude: -90.291963)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius, regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
        //tracking and displaying your location 
            mapView.showsUserLocation = true
            
            if CLLocationManager.locationServicesEnabled() == true {
                
                if CLLocationManager.authorizationStatus() == .restricted ||
                    CLLocationManager.authorizationStatus() == .denied ||
                    CLLocationManager.authorizationStatus() == .notDetermined {
                    locationManager.requestWhenInUseAuthorization()
                }
                locationManager.desiredAccuracy = 1.0
                locationManager.delegate = self
                locationManager.startUpdatingLocation()
                
            } else {
                print("Please turn on location services or GPS")
            }
            
            
        }
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
//            let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
//            self.mapView = region
//        }
//
//        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
//
//        }
//
        centerMapOnLocation(location: initialLocation)
        // show exhibit on map
        mapView.delegate = self
        //Adding Red Rocks exhibits
        let snowleopard = Exhibits(title: "Snow Leopard", locationName: "Red Rocks", discipline: "Cat", coordinate: CLLocationCoordinate2D(latitude: 38.633456, longitude: -90.287437), fact: "The endangered Snow Leopard is native to the rugged and snowy highlands of Central Asia.", type: .redRocks)
        let serval = Exhibits(title: "Serval", locationName: "Red Rocks", discipline: "Cat", coordinate: CLLocationCoordinate2D(latitude: 38.633524, longitude: -90.287365), fact: "Serval has the biggest ears (compared to the rest of the body) and longest legs in the world of cats. Serval's ears serve as radars which easily recognize sound produced by moving animal (even when they are moving in the underground tunnels).", type: .redRocks)
        let amurleopard = Exhibits(title: "Amur Leopard", locationName: "Red Rocks", discipline: "Cat", coordinate: CLLocationCoordinate2D(latitude: 38.633592, longitude: -90.287288), fact: "the leopard", type: .redRocks)
        let jaguar = Exhibits(title: "Jaguar", locationName: "Red Rocks", discipline: "Cat", coordinate: CLLocationCoordinate2D(latitude: 38.633871, longitude: -90.287339), fact: "the jaguar", type: .redRocks)
        let puma = Exhibits(title: "Puma", locationName: "Red Rocks", discipline: "Cat", coordinate: CLLocationCoordinate2D(latitude: 38.633365, longitude: -90.287601), fact: "the puma", type: .redRocks)
        let amurtigers = Exhibits(title: "Amur Tigers", locationName: "Red Rocks", discipline: "Cat", coordinate: CLLocationCoordinate2D(latitude: 38.633712, longitude: -90.287648), fact: "the tiger", type: .redRocks)
        let africanlions = Exhibits(title: "African Lions", locationName: "Red Rocks", discipline: "Cat", coordinate: CLLocationCoordinate2D(latitude: 38.633344, longitude: -90.287810), fact: "the lion", type: .redRocks)
        let grevyzebraone = Exhibits(title: "Grevy's Zebra", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633257, longitude: -90.287177), fact: "the grevy", type: .redRocks)
        let grevyzebratwo = Exhibits(title: "Grevy's Zebra", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633513, longitude: -90.286932), fact: "the grevy", type: .redRocks)
        let bactriancamel = Exhibits(title: "Bactrian Camel", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633622, longitude: -90.286692), fact: "the camel", type: .redRocks)
        let addax = Exhibits(title: "Addax", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633673, longitude: -90.286451), fact: "the addax", type: .redRocks)
        let somaliwildass = Exhibits(title: "Somali Wild Ass", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633699, longitude: -90.286182), fact: "the ass", type: .redRocks)
        let banteng = Exhibits(title: "Banteng", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633462, longitude: -90.285940), fact: "the banteng", type: .redRocks)
        let saruscrane = Exhibits(title: "Sarus Crane", locationName: "Red Rocks", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.633646, longitude: -90.285779), fact: "the sarus", type: .redRocks)
        let babirusa = Exhibits(title: "Babirusa", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634047, longitude: -90.285471), fact: "the babirusa", type: .redRocks)
        let spekegazelleone = Exhibits(title: "Speke's Gazelle", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634226, longitude: -90.285354), fact: "the speke", type: .redRocks)
        let spekegazelletwo = Exhibits(title: "Speke's Gazelle", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634417, longitude: -90.285324), fact: "the speke", type: .redRocks)
        let redkangaroo = Exhibits(title: "Red Kangaroo", locationName: "Red Rocks", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634331, longitude: -90.285368), fact: "the red", type: .redRocks)
        let visayanwartypig = Exhibits(title: "Visayan Warty Pig", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634510, longitude: -90.285356), fact: "the warty pig", type: .redRocks)
        let eastafricancrownedcrane = Exhibits(title: "East African Crowned Crane", locationName: "Red Rocks", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634658, longitude: -90.285377), fact: "the african", type: .redRocks)
        let nyala = Exhibits(title: "Nyala", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634794, longitude: -90.285470), fact: "the nyala", type: .redRocks)
        let gerenuk = Exhibits(title: "Gerenuk", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633942, longitude: -90.285854), fact: "the gerenuk", type: .redRocks)
        let ostrich = Exhibits(title: "Ostrich", locationName: "Red Rocks", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634466, longitude: -90.285854), fact: "the ostrich", type: .redRocks)
        let reticulatedgiraffe = Exhibits(title: "Reticulated Giraffe", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634061, longitude: -90.286088), fact: "the giraffe", type: .redRocks)
        let addragazelle = Exhibits(title: "Addra Gazelle", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634254, longitude: -90.286157), fact: "the addra", type: .redRocks)
        let okapi = Exhibits(title: "Okapi", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634795, longitude: -90.285907), fact: "the okapi", type: .redRocks)
        let spekegazellethree = Exhibits(title: "Speke's Gazelle", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.635057, longitude: -90.286908), fact: "the speke", type: .redRocks)
        let saddlebilledstork = Exhibits(title: "Saddle Billed Stork", locationName: "Red Rocks", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634988, longitude: -90.286613), fact: "the saddle", type: .redRocks)
        let lesserkudu = Exhibits(title: "Lesser Kudu", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.635186, longitude: -90.286634), fact: "the lesser kudu", type: .redRocks)
        let soemmerringgazelle = Exhibits(title: "Soemmerring's Gazelle", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634956, longitude: -90.286144), fact: "the soemmerring", type: .redRocks)
        let babirusatwo = Exhibits(title: "Babirusa", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634835, longitude: -90.287002), fact: "the babirusa", type: .redRocks)
        let babirusathree = Exhibits(title: "Babirusa", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634667, longitude: -90.286890), fact: "the babirusa", type: .redRocks)
        let somaliwildasstwo = Exhibits(title: "Somali Wild Ass", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634503, longitude: -90.286558), fact: "the ass", type: .redRocks)
        let chinesegoral = Exhibits(title: "Chinese Goral", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634181, longitude: -90.286515), fact: "the chinese", type: .redRocks)
        let takin = Exhibits(title: "Takin", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633972, longitude: -90.286486), fact: "the takin", type: .redRocks)
        let transcaspianurial = Exhibits(title: "Transcaspian Urial", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634297, longitude: -90.286777), fact: "the urial", type: .redRocks)
        let addragazelletwo = Exhibits(title: "Addra's Gazelle", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.634432, longitude: -90.287059), fact: "the addra", type: .redRocks)
        let wattledcrane = Exhibits(title: "Wattled Crane", locationName: "Red Rocks", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634542, longitude: -90.287144), fact: "The wattled", type: .redRocks)
        let chinesegoraltwo = Exhibits(title: "Chinese Goral", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633926, longitude: -90.286815), fact: "the urial", type: .redRocks)
        let takintwo = Exhibits(title: "Takin", locationName: "Red Rocks", discipline: "Hoofed", coordinate: CLLocationCoordinate2D(latitude: 38.633953, longitude: -90.286974), fact: "the addra", type: .redRocks)
        let eastafricancrownedcranetwo = Exhibits(title: "East African Crowned Crane", locationName: "Red Rocks", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634306, longitude: -90.287195), fact: "The wattled", type: .redRocks)
        
        
        //adds Historic Hill exhibits
        let primatehouse = Exhibits(title: "Primate House", locationName: "Historic Hill", discipline: "Primates", coordinate: CLLocationCoordinate2D(latitude: 38.633720, longitude: -90.289084), fact: "the primate", type: .historicHill)
        let herpetarium = Exhibits(title: "Herpetarium", locationName: "Historic Hill", discipline: "Amphibians and Reptiles", coordinate: CLLocationCoordinate2D(latitude: 38.634230, longitude: -90.289924), fact: "the insect", type: .historicHill)
        let birdhouse = Exhibits(title: "Bird House", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634850, longitude: -90.288235), fact: "the birdhouse", type: .historicHill)
        let cageandcypressswamp = Exhibits(title: "1904 World's Fair Flight Cage and Cypress Swamp", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.635625, longitude: -90.287764), fact: "the cage", type: .historicHill)
        let cabotstragopan = Exhibits(title: "Cabot's Tragopan", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634903, longitude: -90.287554), fact: "the cabot", type: .historicHill)
        let helmetedcurassow = Exhibits(title: "Helmeted Curassow", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634919, longitude: -90.287335), fact: "the helmeted", type: .historicHill)
        let greathornedowl = Exhibits(title: "Great Horned Owl", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.635012, longitude: -90.287425), fact: "the great horned owl", type: .historicHill)
        let laughingkookaburra = Exhibits(title: "Laughing Kookaburra", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.635017, longitude: -90.287684), fact: "the laughing", type: .historicHill)
        let whitenapedcrane = Exhibits(title: "White-naped Crane", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.635288, longitude: -90.287879), fact: "the white", type: .historicHill)
        let spectacledowl = Exhibits(title: "Spectacled Owl", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.635182, longitude: -90.287600), fact: "the spectacled", type: .historicHill)
        let cabotstragopantwo = Exhibits(title: "Cabot's Tragopan", locationName: "Historic Hill", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.635155, longitude: -90.287456), fact: "the cabot", type: .historicHill)
        
        //adds The Wild exhibits
        let grizzlybear = Exhibits(title: "Grizzly Bear", locationName: "The Wild", discipline: "Bear", coordinate:  CLLocationCoordinate2D(latitude: 38.636460, longitude: -90.290590), fact: "the cabot", type: .theWild)
        let polarbear = Exhibits(title: "Polar Bear", locationName: "The Wild", discipline: "Bear", coordinate:  CLLocationCoordinate2D(latitude: 38.636862, longitude: -90.289862), fact: "the cabot", type: .theWild)
        let penguinandpuffincoast = Exhibits(title: "Penguin & Puffin Coast", locationName: "The Wild", discipline: "Bird", coordinate:  CLLocationCoordinate2D(latitude: 38.636564, longitude: -90.290411), fact: "the cabot", type: .theWild)
        let prairiedog = Exhibits(title: "Black-tailed Prairie Dog", locationName: "The Wild", discipline: "Mammal", coordinate:  CLLocationCoordinate2D(latitude: 38.635213, longitude: -90.289576), fact: "the cabot", type: .theWild)
        let redpanda = Exhibits(title: "Red Panda", locationName: "The Wild", discipline: "Mammal", coordinate:  CLLocationCoordinate2D(latitude: 38.635396, longitude: -90.289673), fact: "the cabot", type: .theWild)
        let caribbeanflamingo = Exhibits(title: "Caribbean Flamingo", locationName: "The Wild", discipline: "Bird", coordinate:  CLLocationCoordinate2D(latitude: 38.636520, longitude: -90.289366), fact: "the cabot", type: .theWild)
        let americanwhitepelican = Exhibits(title: "American White Pelican", locationName: "The Wild", discipline: "Bird", coordinate:  CLLocationCoordinate2D(latitude: 38.635870, longitude: -90.290479), fact: "the cabot", type: .theWild)
        let canadagoose = Exhibits(title: "Canada Goose & Other Water Fowl", locationName: "The Wild", discipline: "Bird", coordinate:  CLLocationCoordinate2D(latitude: 38.635892, longitude: -90.290411), fact: "the cabot", type: .theWild)
        let sumatranorangutan = Exhibits(title: "Sumatran Orangutan", locationName: "The Wild", discipline: "Primate", coordinate:  CLLocationCoordinate2D(latitude: 38.635686, longitude: -90.289424), fact: "the cabot", type: .theWild)
        let westernlowlandgorilla = Exhibits(title: "Western Lowland Gorilla", locationName: "The Wild", discipline: "Primate", coordinate:  CLLocationCoordinate2D(latitude: 38.635734, longitude: -90.288718), fact: "the cabot", type: .theWild)
        let chimpanzee = Exhibits(title: "Chimpanzee", locationName: "The Wild", discipline: "Primate", coordinate:  CLLocationCoordinate2D(latitude: 38.635347, longitude: -90.288994), fact: "the cabot", type: .theWild)
        
        //add Lakeside Crossing exhibits
        let trumpeterswan = Exhibits(title: "Trumpeter Swan", locationName: "Lakeside Crossing", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.635397, longitude: -90.291402), fact: "the cabot", type: .lakesideCrossing)
        let canadagoosetwo = Exhibits(title: "Canada Goose & Other Water Fowl", locationName: "Lakeside Crossing", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.635269, longitude: -90.291111), fact: "the cabot", type: .lakesideCrossing)
        let stingrays = Exhibits(title: "Stingrays", locationName: "Lakeside Crossing", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.635594, longitude: -90.291077), fact: "the cabot", type: .lakesideCrossing)
        let californiasealion = Exhibits(title: "California Sea Lion", locationName: "Lakeside Crossing", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634990, longitude: -90.289926), fact: "the cabot", type: .lakesideCrossing)
        let harborseal = Exhibits(title: "Harbor Seal", locationName: "Lakeside Crossing", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.635001, longitude: -90.289795), fact: "the cabot", type: .lakesideCrossing)
        
        
        // add Dicovery Corner exhibits
        let insectarium = Exhibits(title: "Insectarium", locationName: "Discovery Center", discipline: "Insects", coordinate: CLLocationCoordinate2D(latitude: 38.635075, longitude: -90.291557), fact: "the cabot", type: .discoveryCorner)
        let childrenszoo = Exhibits(title: "Children's Zoo", locationName: "Discovery Center", discipline: "Animals", coordinate: CLLocationCoordinate2D(latitude: 38.635531, longitude: -90.292303), fact: "the cabot", type: .discoveryCorner)
        
        
        //add River's Edge exhibits
        let giantanteater = Exhibits(title: "Giant Anteater", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634395, longitude: -90.292758), fact: "the cabot", type: .riversEdge)
        let bushdog = Exhibits(title: "Bush Dog", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634174, longitude: -90.292745), fact: "the cabot", type: .riversEdge)
        let capybara = Exhibits(title: "Capybara", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634227, longitude: -90.293064), fact: "the cabot", type: .riversEdge)
        let painteddogs = Exhibits(title: "Painted Dogs", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634444, longitude: -90.293233), fact: "the cabot", type: .riversEdge)
        let blackrhino = Exhibits(title: "Black Rhino", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634065, longitude: -90.293365), fact: "the cabot", type: .riversEdge)
        let sacredibis = Exhibits(title: "Sacred Ibis", locationName: "River's Edge", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634054, longitude: -90.293424), fact: "the cabot", type: .riversEdge)
        let birds = Exhibits(title: "Birds", locationName: "River's Edge", discipline: "Bird", coordinate: CLLocationCoordinate2D(latitude: 38.634163, longitude: -90.293810), fact: "the cabot", type: .riversEdge)
        let hippos = Exhibits(title: "Nile Hippopotamus", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.633747, longitude: -90.293900), fact: "the cabot", type: .riversEdge)
        let redriverhog = Exhibits(title: "Red River Hog", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634212, longitude: -90.293946), fact: "the cabot", type: .riversEdge)
        let batearredfox = Exhibits(title: "Bat Earred Fox", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634190, longitude: -90.293979), fact: "the cabot", type: .riversEdge)
        let spottedhyena = Exhibits(title: "Spotted Hyena", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634121, longitude: -90.294428), fact: "the cabot", type: .riversEdge)
        let cheetah = Exhibits(title: "Cheetah", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634199, longitude: -90.294630), fact: "the cabot", type: .riversEdge)
        let dwarfmongoose = Exhibits(title: "Dwarf Mongoose", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634331, longitude: -90.294438), fact: "the cabot", type: .riversEdge)
        let asianelephant = Exhibits(title: "Asian Elephant", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634758, longitude: -90.293940), fact: "the cabot", type: .riversEdge)
        let sunbear = Exhibits(title: "Sun Bear", locationName: "River's Edge", discipline: "Mammal", coordinate: CLLocationCoordinate2D(latitude: 38.634674, longitude: -90.292990), fact: "the cabot", type: .riversEdge)
        let fishes = Exhibits(title: "Variety of Fish", locationName: "River's Edge", discipline: "Fish", coordinate: CLLocationCoordinate2D(latitude: 38.634703, longitude: -90.292278), fact: "the cabot", type: .riversEdge)
        
       
        
        // adds the information to the map for Red Rocks
        mapView.addAnnotation(snowleopard)
        mapView.addAnnotation(serval)
        mapView.addAnnotation(amurleopard)
        mapView.addAnnotation(jaguar)
        mapView.addAnnotation(puma)
        mapView.addAnnotation(amurtigers)
        mapView.addAnnotation(africanlions)
        mapView.addAnnotation(grevyzebraone)
        mapView.addAnnotation(grevyzebratwo)
        mapView.addAnnotation(bactriancamel)
        mapView.addAnnotation(addax)
        mapView.addAnnotation(somaliwildass)
        mapView.addAnnotation(banteng)
        mapView.addAnnotation(saruscrane)
        mapView.addAnnotation(babirusa)
        mapView.addAnnotation(spekegazelleone)
        mapView.addAnnotation(spekegazelletwo)
        mapView.addAnnotation(redkangaroo)
        mapView.addAnnotation(visayanwartypig)
        mapView.addAnnotation(eastafricancrownedcrane)
        mapView.addAnnotation(nyala)
        mapView.addAnnotation(gerenuk)
        mapView.addAnnotation(ostrich)
        mapView.addAnnotation(reticulatedgiraffe)
        mapView.addAnnotation(addragazelle)
        mapView.addAnnotation(okapi)
        mapView.addAnnotation(spekegazellethree)
        mapView.addAnnotation(saddlebilledstork)
        mapView.addAnnotation(lesserkudu)
        mapView.addAnnotation(soemmerringgazelle)
        mapView.addAnnotation(babirusatwo)
        mapView.addAnnotation(babirusathree)
        mapView.addAnnotation(somaliwildasstwo)
        mapView.addAnnotation(chinesegoral)
        mapView.addAnnotation(takin)
        mapView.addAnnotation(transcaspianurial)
        mapView.addAnnotation(addragazelletwo)
        mapView.addAnnotation(wattledcrane)
        mapView.addAnnotation(chinesegoraltwo)
        mapView.addAnnotation(takintwo)
        mapView.addAnnotation(eastafricancrownedcranetwo)
        
        //adds the information to the map for Historic Hill
        mapView.addAnnotation(primatehouse)
        mapView.addAnnotation(herpetarium)
        mapView.addAnnotation(birdhouse)
        mapView.addAnnotation(cageandcypressswamp)
        mapView.addAnnotation(cabotstragopan)
        mapView.addAnnotation(helmetedcurassow)
        mapView.addAnnotation(greathornedowl)
        mapView.addAnnotation(laughingkookaburra)
        mapView.addAnnotation(whitenapedcrane)
        mapView.addAnnotation(spectacledowl)
        mapView.addAnnotation(cabotstragopantwo)

        //adds the information to the map for The Wild
        mapView.addAnnotation(grizzlybear)
        mapView.addAnnotation(polarbear)
        mapView.addAnnotation(penguinandpuffincoast)
        mapView.addAnnotation(prairiedog)
        mapView.addAnnotation(redpanda)
        mapView.addAnnotation(caribbeanflamingo)
        mapView.addAnnotation(americanwhitepelican)
        mapView.addAnnotation(canadagoose)
        mapView.addAnnotation(sumatranorangutan)
        mapView.addAnnotation(westernlowlandgorilla)
        mapView.addAnnotation(chimpanzee)
        
        //adds the information to the map for Lakeside Crossing
        mapView.addAnnotation(trumpeterswan)
        mapView.addAnnotation(canadagoosetwo)
        mapView.addAnnotation(stingrays)
        mapView.addAnnotation(californiasealion)
        mapView.addAnnotation(harborseal)
        
        
        // adds the information to the map for Dicovery Corner
        mapView.addAnnotation(insectarium)
        mapView.addAnnotation(childrenszoo)
       
        //adds the information to the map for River's Edge
        mapView.addAnnotation(giantanteater)
        mapView.addAnnotation(bushdog)
        mapView.addAnnotation(capybara)
        mapView.addAnnotation(painteddogs)
        mapView.addAnnotation(blackrhino)
        mapView.addAnnotation(sacredibis)
        mapView.addAnnotation(birds)
        mapView.addAnnotation(hippos)
        mapView.addAnnotation(redriverhog)
        mapView.addAnnotation(batearredfox)
        mapView.addAnnotation(spottedhyena)
        mapView.addAnnotation(cheetah)
        mapView.addAnnotation(dwarfmongoose)
        mapView.addAnnotation(asianelephant)
        mapView.addAnnotation(sunbear)
        mapView.addAnnotation(fishes)
        
        
    }


}
extension ViewController: MKMapViewDelegate {
    // 1
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        // 2
//        guard let annotation = annotation as? Exhibits else { return nil }
//
//        // 3
//        let identifier = "marker"
//        var view: MKMarkerAnnotationView
//        // 4
//        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//            as? MKMarkerAnnotationView {
//            dequeuedView.annotation = annotation
//            view = dequeuedView
//        } else {
//            // 5
//            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//            view.canShowCallout = true
//            view.calloutOffset = CGPoint(x: -5, y: 5)
//            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
//        }
//
//        return view
//    }
}


