# Reverse Mobile Challenge

You have an Android application where you need a password to sign in. You need to find the password.

> reverse, mobile

## Writeup

A good place to start is to run the application on your device or the Android emulator that is shipped with [Android Studio](https://developer.android.com/studio/).

To install the APK in your emulator or on your _connected_ device:

```
adb install CrackMeBaby.apk
```

Now decompile the APK using [jadx](https://github.com/skylot/jadx).

```
$ jadx -d decompiled CrackMeBaby.apk
```

This will create the directory `decompiled` with `resources` and `sources` directories.

If you open `decompiled/resources/AndroidManifest.xml` you'll see the reference to the application code.

```xml
<!-- ... -->
<activity android:label="@string/app_name" android:name="ca.cfiul.crackmebaby.LoginActivity">
    <intent-filter>
        <action android:name="android.intent.action.MAIN"/>
        <category android:name="android.intent.category.LAUNCHER"/>
    </intent-filter>
</activity>
<!-- ... -->
```

In this case it's `ca.cfiul.crackmebaby.LoginActivity`. The namespace is `ca.cfiul.crackmebaby`. Here are the files that belong to this namespace:

```
$ ls -1  decompiled/sources/ca/cfiul/crackmebaby/
BuildConfig.java
LoginActivity.java
R.java
```

Let's read the code of `LoginActivity.java`:

```java
public class LoginActivity extends AppCompatActivity {
    private static final int PASSWORD_MIN_LENGTH = 30;
    private static final char[] SECRET_PASSWORD_CHARACTERS = new char[]{'3', 'c', 'f', '1', '0', '8', 'a', '4', 'e', '0', 'a', '4', '9', '8', '3', '4', '7', 'a', '5', 'a', '7', '5', 'a', '7', '9', '2', 'f', '2', '3', '2', '1', '2', '-', 'G', 'A', 'L', 'F'};
    private EditText mPasswordView;

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView((int) R.layout.activity_login);
        this.mPasswordView = (EditText) findViewById(R.id.password);
        ((Button) findViewById(R.id.sign_in_button)).setOnClickListener(new OnClickListener() {
            public void onClick(View view) {
                LoginActivity.this.attemptLogin();
            }
        });
    }

    private void attemptLogin() {
        this.mPasswordView.setError(null);
        Context context = getApplicationContext();
        String password = this.mPasswordView.getText().toString();
        if (TextUtils.isEmpty(password)) {
            Toast.makeText(context, R.string.error_field_required, 1).show();
        } else if (password.length() < 30) {
            Toast.makeText(context, R.string.error_invalid_password_too_short, 1).show();
        } else if (passwordMatch(password)) {
            Toast.makeText(context, R.string.success, 1).show();
        } else {
            Toast.makeText(context, R.string.error_invalid_password_not_matching, 1).show();
        }
    }

    private boolean passwordMatch(String password) {
        int length = SECRET_PASSWORD_CHARACTERS.length;
        if (password.length() != length) {
            return false;
        }
        for (int i = 0; i < SECRET_PASSWORD_CHARACTERS.length; i++) {
            if (password.charAt((length - 1) - i) != SECRET_PASSWORD_CHARACTERS[i]) {
                return false;
            }
        }
        return true;
    }
}
```

When the activity is created the method `onCreate` is called. It adds a `setOnClickListener` on the "Sign In" button which calls the `attemptLogin` method. This method calls `passwordMatch`. This method takes, `password` and compare each character from the right to left, with the character in `SECRET_PASSWORD_CHARACTERS` from the left to the right.

So to retrieve the password, we need to concat all the `char` of `SECRET_PASSWORD_CHARACTERS` and reverse it.

We can do it using `ruby`:

```shell
$ irb
irb(main):001:0> ['3', 'c', 'f', '1', '0', '8', 'a', '4', 'e', '0', 'a', '4', '9', '8', '3', '4', '7', 'a', '5', 'a', '7', '5', 'a', '7', '9', '2', 'f', '2', '3', '2', '1', '2', '-', 'G', 'A', 'L', 'F'].reverse.join('')
=> "FLAG-21232f297a57a5a743894a0e4a801fc3"
```
