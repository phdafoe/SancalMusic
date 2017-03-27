//
//  AppDelegate.m
//  SancalMusic
//
//  Created by User on 7/12/14.
//  Copyright (c) 2014 iCologic. All rights reserved.
//

#import "AppDelegate.h"
#import "iCoInstrumentsModel.h"
#import "ICOStoreModel.h"
#import "ICOINstrumentViewController.h"
#import "ICOWebViewController.h"
#import "ICOStoreTableViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    //Creamos el modelo
    
    
    /*iCoInstrumentsModel *electricGuitar = [iCoInstrumentsModel instrumentsModelWithName:@"JOHNNY MARR JAGUAR"
                                                                 instrumentsCompanyName:@"FENDER"
                                                                         typeInstrument:@"ELECTRIC GUITAR"
                                                                         markInstrument:@"JAGUAR"
                                                                  combinationInstrument:@[@" ELECTRIC"]
                                                                   instrumentCompanyWeb:[NSURL URLWithString:@"http://www.fender.com/es-ES/guitars/jaguar/johnny-marr-jaguar-rosewood-fingerboard-olympic-white/"]
                                                                                  notes:@"Fender is very proud to introduce the Johnny Marr signature Jaguar® guitar. Marr is best known, of course, as the strikingly dynamic and influential anti-hero guitarist-arranger-all-around-musical-wunderkind behind Manchester quartet the Smiths, which virtually redefined and ruled U.K. pop throughout the 1980s. A master of melody, layering and texture, Marr has always brought his own instantly identifiable ringing, jangling genius to the proceedings, as he has done in post-Smiths stints with The The, Electronic, the Pretenders and Johnny Marr and the Healers, and right up to the present with Modest Mouse, the Cribs and innumerable guest appearances. The Johnny Marr signature Jaguar is a fantastically non-standard version of the model that is as distinctive as the sounds Marr wrings from it, with a wealth of highly specialized features including custom-wound Bare Knuckle Johnny Marr single-coil neck and bridge pickups; custom-shaped maple neck based on Marr's 1965 Jaguar, with vintage-style truss rod, lacquer finish and Marr's signature on the front of the headstock; four-position blade-style pickup switch mounted to the lower-horn chrome plate (bridge, bridge and neck in parallel, neck, bridge and neck in series); two upper-horn slide switches (universal bright and pickup switch position four bright); Jaguar bridge with Mustang saddles, nylon bridge post inserts for improved stability, chrome cover and vintage-style floating tremolo tailpiece; and 'taller' tremolo arm with arm-sleeve nylon insert to prevent arm swing."
                                                                       ratingInstrument:4
                                                                                  photo:[UIImage imageNamed:@"guitar.png"]];
    
     ---------------------------------------------------------------------------------------------------------------------------------
    
    iCoInstrumentsModel *drumsVintage = [iCoInstrumentsModel instrumentsModelWithName:@"CATALINA CLUB"
                                                                 instrumentsCompanyName:@"GRETSCH"
                                                                         typeInstrument:@"DRUM"
                                                                         markInstrument:@"CATALINA CLUB VINTAGE CLASSIC"
                                                                  combinationInstrument:@[@" VINTAGE CLASSIC"]
                                                                   instrumentCompanyWeb:[NSURL URLWithString:@"http://www.gretschdrums.com/?fa=drums&sid=702#specs"]
                                                                                  notes:@"We have teamed up with Sabian cymbals and Vic Firth sticks to create the new Gretsch Energy Series. Modelled around a 7 ply poplar shell and fitted with Gretsch by Remo®drumheads, the kits come complete with Gretsch hardware pack and Sabian SBR cymbals. Gretsch Energy is packed with features and perfect for the first time drum set buyer."
                                                                       ratingInstrument:3
                                                                                  photo:[UIImage imageNamed:@"drum.jpg"]];
    
     ---------------------------------------------------------------------------------------------------------------------------------
    
    iCoInstrumentsModel *pianoClassic = [iCoInstrumentsModel instrumentsModelWithName:@"V-PIANO CLASSIC"
                                                                 instrumentsCompanyName:@"V-PIAO"
                                                                         typeInstrument:@"PIANO CLASSIC"
                                                                         markInstrument:@"ROLAND PREMIERES"
                                                                  combinationInstrument:@[@" CLASSIC SOUND, 50% ELECTRONIC SOUND"]
                                                                   instrumentCompanyWeb:[NSURL URLWithString:@"http://www.rolandus.com/products/details/1158/articles/"]
                                                                                  notes:@"With its groundbreaking approach to grand-piano modeling, and incredibly realistic sound, touch, and response, Roland’s V-Piano® has earned many international awards and accolades since its debut in 2009. It has become the #1 choice for many of the most discerning pianists on the planet. So how does the V-Piano evolve? Introducing the V-Piano Grand! Built into an elegant grand-piano cabinet, and with a unique, multi-channel sound system that reacts naturally and intelligently to your performance, this exquisite instrument blurs the line between digital and acoustic worlds. Stepping up from the previous generation, the V-Piano Grand’s sound generator has been further refined, and new piano models have been added to the onboard library. Welcome to a new world of performance, sophistication, and musical innovation."
                                                                       ratingInstrument:4
                                                                                  photo:[UIImage imageNamed:@"v-piano.jpg"]];
    
    
    
    
    
    ---------------------------------------------------------------------------------------------------------------------------------*/
    
    
    
    /*------------------ fase 1 -----------------------------*/
    
    //Creamos el controlador
    //ICOINstrumentViewController *InstrumentVC = [[ICOINstrumentViewController alloc]initWithModel:electricGuitar];
    //ICOWebViewController *WebViewVC = [[ICOWebViewController alloc]initWithModel:electricGuitar];
    
    //Fase 2 Creacion de Combinador TABBARCONTROLLER
    
    //UITabBarController *tabVC = [[UITabBarController alloc]init];
    //tabVC.viewControllers = @[InstrumentVC,WebVC];
    
    //El controlador raiz
    /*self.window.rootViewController = tabVC;*/
    
    /*------------------ fase 1 -----------------------------*/
    
    
    /*------------------ fase 2 -----------------------------*/
    
    // Creacion de 2 Controladores
    //ICOINstrumentViewController *InstrumentVC = [[ICOINstrumentViewController alloc]initWithModel:electricGuitar];
    
    //Creamos el combinador
    //UINavigationController *guitarNavC = [[UINavigationController alloc]initWithRootViewController:guitarVC];
    
    //El controlador raiz
    //self.window.rootViewController = guitarNavC;
    
    
    
    /*------------------ fase 2 -----------------------------*/
    
    /*------------------ fase 3 -----------------------------*/
    
    //Controladores uno por cada modelo
    
    /*ICOINstrumentViewController *guitarVC = [[ICOINstrumentViewController alloc]initWithModel:electricGuitar];
     ICOINstrumentViewController *drumVC = [[ICOINstrumentViewController alloc]initWithModel:drumsVintage];
     ICOINstrumentViewController *pianoVC = [[ICOINstrumentViewController alloc]initWithModel:pianoClassic];*/
    
    //Creacion del Combinador NAVIGATIONCONTROLLER  // Fase de creacion un navigation por cada controlador
    
    /*UINavigationController *guitarNavC = [[UINavigationController alloc]initWithRootViewController:guitarVC];
     UINavigationController *drumNavC = [[UINavigationController alloc]initWithRootViewController:drumVC];
     UINavigationController *pianoNavC = [[UINavigationController alloc]initWithRootViewController:pianoVC];*/
    
    //Creamos el combinador de la fase 4 -->
    
    /*UITabBarController *tabVC = [[UITabBarController alloc]init];
     tabVC.viewControllers = @[guitarNavC, drumNavC, pianoNavC];*/
    
    //El controlador raiz
    /*self.window.rootViewController = tabVC;*/
 
    
    /*------------------ fase 3 -----------------------------*/
    
    
    /*------------------ fase 4 -----------------------------*/
    
    
    /*//Creamos el Modelo -->
    //inicializamos el modelo Store
    ICOStoreModel *store = [[ICOStoreModel alloc]init];
    
    //Creamos el controlador -->
    ICOStoreTableViewController *storeVC = [[ICOStoreTableViewController alloc]initWithModel:store tableStyle:UITableViewStylePlain];
    
    //Creamos un Navigation
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:storeVC];
    
    //Controlador raiz
    self.window.rootViewController = navVC;*/
    
    
    
    
    /*------------------ fase 4 -----------------------------*/
    
    
    /*------------------ fase 5 -----------------------------*/
    //creamos el modelo
    ICOStoreModel *store = [[ICOStoreModel alloc]init];
    
    //creamos los controladores
    ICOStoreTableViewController *storeVC = [[ICOStoreTableViewController alloc]initWithModel:store tableStyle:UITableViewStylePlain];
    
    //debemos colocarle el primero de la primera seccion este es el modelo de donde partimos --> con la persistencia de datos usando NSUserDafault debemos modificar esta linea
    //ICOINstrumentViewController *instrumentVC = [[ICOINstrumentViewController alloc]initWithModel:[store guitarAtIndex:0]];
    
    ICOINstrumentViewController *instrumentVC = [[ICOINstrumentViewController alloc]initWithModel:[storeVC lastSelectedInstrument]];
      
    
    //Creamos los navigation
    
    UINavigationController *storeNav = [[UINavigationController alloc]initWithRootViewController:storeVC];
    UINavigationController *instrumentNav = [[UINavigationController alloc]initWithRootViewController:instrumentVC];
    
    
    //Creamos el combinador --> SplitView
    UISplitViewController *splitVC = [[UISplitViewController alloc]init];
    splitVC.viewControllers = @[storeNav, instrumentNav];
    
    
    //Asignamos delegados le decimos al splitVC que su delegado es instrumentVC
    splitVC.delegate = instrumentVC;
    storeVC.delegate = instrumentVC;
    
    
    //Asignamos el controlador raiz
    self.window.rootViewController = splitVC;
    /*------------------ fase 5 -----------------------------*/
    
    
    
    
    
    
   
    
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
