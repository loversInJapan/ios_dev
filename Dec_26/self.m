// self指向当前对象,可以调当前对象的变量和方法
// 同时self也能指向类。比如能在一个类方法中调用另一个类方法

#import <Foundation/Foundation.h>

@interface Person : NSObject //NSObject是一个根类，几乎所有的OC类都要继承它，才能创建对象。但NSProxy除外，因为NSProxy也是一个根类
{
    int _age;
}

- (void)setAge:(int)age;
- (void)use_self;
- (void)work_out;
- (void)run;
@end

@implementation Person

- (void)setAge:(int)age
{
    _age = age;
}

-(void)use_self
{
    int _age = 20;
    NSLog(@"age = %d", self->_age);
}

- (void)run
{
    NSLog(@"I'm running");
}

- (void)work_out
{
    [self run];
}
@end

int main()
{
    Person* boy = [Person new];
    [boy setAge:10];
    [boy use_self];
    [boy run];
    return 0;
}
