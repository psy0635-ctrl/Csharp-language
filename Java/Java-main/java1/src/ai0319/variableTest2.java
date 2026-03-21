package ai0319;

public class variableTest2 {
    public static void main(String[] args) {
        int num1 , num2 , result , result2;

        num1 = 300;
        num2 = 500;
        result = num1 + num2;
        result2 = num1  * num2;
        int result3 = num1 / num2;
//        result = 10;

        //지역 변수는 초기화를 꼭 하고 사용해야 한다.
        System.out.println(num1 + "+" + num2 + "=" + result);
        System.out.printf("%d + %d = %d\n" , num1 ,num2 , result );
        System.out.printf("%d × %d = %d\n" , num1 ,num2 , result2 );
        System.out.printf("%d ÷ %d = %d" , num1 ,num2 , result3 );
    }

}

