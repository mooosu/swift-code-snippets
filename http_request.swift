import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet var ipLabel: UILabel

    func handler(response: NSURLResponse!, data : NSData!, error : NSError!) {
        
        if (error) {
            println(error)
        } else {
            var ip = NSString(data:data, encoding:NSUTF8StringEncoding)
            println("async fetch: " + ip);
            self.ipLabel.text = ip
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string:"http:/tdgunes.org/getip/")
        var request = NSURLRequest(URL: url)

        ipLabel.text = "Fetching...";
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue(), completionHandler:handler)

        var data = NSData(contentsOfURL:url);
        ipLabel.text =  NSString(data:data, encoding:NSUTF8StringEncoding)
        println("Normal fetch!")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
