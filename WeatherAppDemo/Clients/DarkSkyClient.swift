/*

 1.Set up the HTTP request with URLSession
 2.Make the request with URLSessionDataTask
 3.Properly validate the response data
 4.Convert the response data to JSON

 */
import Foundation

struct DarkSkyClient {
    static func fetchWeatherData(lat: Double, lng: Double){
        //1 - setting up the request for to get the darkSky data
        let url = "https://api.darksky.net/forecast/\(DarkSkySecretKey.Value)/\(lat),\(lng)"
        let session = URLSession.shared
        let darkSkyUrl = URL.init(string: url)
        guard let dsUrl = darkSkyUrl else {
            fatalError()
        }
       // Work ON THIS
        //2 -
        let task = session.dataTask(with: dsUrl, completionHandler:  { (data, response, error) in
            //4
            if let data = data {
                do {
                   let weatherData = try JSONDecoder().decode(WeatherContainer.self, from: data)
                    print(weatherData)
                } catch {
                    print("JSON Decoding Error: \(error.localizedDescription)")
                }
                
            }
            if let response = response {
                //3
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {return}
                print("URL Response status when making the request: ",httpResponse)
                // This is a value that most webservers return, that explains what the format of the response data is
                guard let mime = response.mimeType, mime == "application/json" else {
                    print("Wrong MIME type!")
                    return
                }
            }
            if let error = error {
                print("Error has a occured when making the request with URLSessionDataTask: \(error)")
            }
        })
        task.resume()
        
        
    }
}
