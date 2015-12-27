#import <Foundation/Foundation.h>

typedef enum{
    kSexMan,
    kSexWoman
}Sex;

typedef struct {
    unsigned year;
    unsigned month;
    unsigned day;
}Date;

typedef enum {
    ColorBlack,
    ColorRed,
    ColorGreen
}Color;

@interface Dog : NSObject
{
    @public
    double weight;
    Color hairColor;
}

-(void)run;
-(void)eat;

@end

@implementation Dog

-(void)run
{
    weight -= 0.5;
    NSLog(@"dog's weight now is %.2f", weight);
}

-(void)eat
{
    weight += 0.5;
    NSLog(@"dog's weight now is %.2f", weight);
}

@end

@interface Student : NSObject
{
    @public
    Sex sex;
    Date birthday;
    double weight;
    Color favorite_color;
    
    Dog* dog;
}

-(void)eat;
-(void)run;
-(void)print;
-(void)walkDog;
-(void)feedDog;

@end

@implementation Student

-(void)eat
{
    weight += 1;
    NSLog(@"student's weight now is %.2f", weight);
}

-(void)run
{
    weight -= 1;
    NSLog(@"student's weight now is %.2f", weight);
}

-(void)print
{
    NSLog(@"sex = %d, color = %d, birthday = %d-%d-%d, weight = %.2f", sex, favorite_color, birthday.year,birthday.month,birthday.day,weight);
}

-(void)walkDog
{
    [dog run];
}

-(void)feedDog
{
    [dog eat];
}
@end

int main()
{
    Dog* adog = [Dog new];
    adog->weight = 12.2;
    adog->hairColor = ColorBlack;
    
    Student* stu1 = [Student new];
    stu1->weight = 50;
    stu1->sex = kSexMan;
    stu1->birthday.year = 1999;
    stu1->birthday.month = 9;
    stu1->birthday.day = 9;
    stu1->favorite_color = ColorGreen;
    
    stu1->dog = adog;
    
    [stu1 print];
    
    [stu1 eat];
    [stu1 eat];
    
    [stu1 run];
    [stu1 run];
    
    [stu1 walkDog];
    [stu1 walkDog];
    [stu1 feedDog];
    return 0;
}