#import <Foundation/Foundation.h>

@interface Zoombie : NSObject

- (void)walk;

@end

@implementation Zoombie

-(void)walk
{
    NSLog(@"move forward two steps");
}

@end

@interface JumpZoombie : Zoombie

- (void)walk;

@end

@implementation JumpZoombie
/*
 1 作用：super可以跨越当前的类，而调用父类的对象方法和类方法。具体取决于super所在的方法的类型，原理于self一样。
 2 用法：如果super的当前方法为对象方法，那么就会调用父类的对象方法；如果super的当前方法为类方法，那么就会调用父类的类方法；
 3 使用场合：子类重写父类的方法时想保留父类的一些行为
 */
- (void)walk
{
    NSLog(@"jump once");
    //NSLog(@"move forward two steps");
    [super walk];
}

@end

int main()
{
    JumpZoombie* jz = [JumpZoombie new];
    [jz walk];
    return 0;
}