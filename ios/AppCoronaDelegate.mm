//
//  AppCoronaDelegate.mm
//  TemplateApp
//
//  Copyright (c) 2019 Uralys. All rights reserved.
//

#import "AppCoronaDelegate.h"

#import <CoronaRuntime.h>
#import <CoronaLua.h>

@implementation AppCoronaDelegate

// -----------------------------------------------------------------------------

lua_State *L;
BOOL hasUniversalLink = NO;

// -----------------------------------------------------------------------------

- (void)willLoadMain:(id<CoronaRuntime>)runtime
{
    L = runtime.L;
}

- (void)didLoadMain:(id<CoronaRuntime>)runtime
{
}

// ----------------------------------------------------------------------------

#pragma mark UIApplicationDelegate methods

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> *)launchOptions {
    NSDictionary *activityDictionary = launchOptions[UIApplicationLaunchOptionsUserActivityDictionaryKey];

    if (activityDictionary) {
        NSUserActivity *userActivity = activityDictionary[UIApplicationLaunchOptionsUserActivityTypeKey];
        if (userActivity) {
            hasUniversalLink = YES;
            return YES;
        }
    }

    return NO;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return hasUniversalLink;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray<id<UIUserActivityRestoring>> * __nullable restorableObjects))restorationHandler{
    if ([userActivity.activityType isEqualToString: NSUserActivityTypeBrowsingWeb]) {
        NSURL* url = userActivity.webpageURL;

        const char nameKey[] = "name";
        const char nameValue[] = "universalLink";
        const char urlKey[] = "url";
        const char* urlValue = [url.absoluteString UTF8String];

        lua_createtable( L, 0, 2 );
        lua_pushstring( L, nameValue );
        lua_setfield( L, -2, nameKey );
        lua_pushstring( L, urlValue );
        lua_setfield( L, -2, urlKey );

        Corona::Lua::DispatchRuntimeEvent( L, -1 );
    }
    return YES;
}

// The following are stubs for common delegate methods. Uncomment and implement
// the ones you wish to be called. Or add additional delegate methods that
// you wish to be called.

/*
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
*/

/*
- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}
*/

/*
- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}
*/

/*
- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
*/

/*
- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
*/

@end
