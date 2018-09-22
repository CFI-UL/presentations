package ca.cfiul.crackmebaby;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;

import android.os.Bundle;
import android.text.TextUtils;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

/**
 * A login screen that offers login via email/password.
 */
public class LoginActivity extends AppCompatActivity {

    private static final int PASSWORD_MIN_LENGTH = 30;
    private static final char[] SECRET_PASSWORD_CHARACTERS = new char[]{
            '3', 'c', 'f', '1', '0', '8', 'a', '4', 'e', '0', 'a', '4', '9', '8', '3', '4', '7', 'a', '5', 'a', '7', '5', 'a', '7', '9', '2', 'f', '2', '3', '2', '1', '2', '-', 'G', 'A', 'L', 'F'
    };

    private EditText mPasswordView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        mPasswordView = (EditText) findViewById(R.id.password);
        Button mSignInButton = (Button) findViewById(R.id.sign_in_button);
        mSignInButton.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                attemptLogin();
            }
        });
    }

    private void attemptLogin() {
        // Reset errors.
        mPasswordView.setError(null);
        // Get password value.
        Context context = getApplicationContext();
        String password = mPasswordView.getText().toString();
        int length = Toast.LENGTH_LONG;

        // Password is empty?
        if (TextUtils.isEmpty(password)) {
            Toast.makeText(context, R.string.error_field_required, length).show();
            return;
        }

        // Password is too short?
        if (password.length() < PASSWORD_MIN_LENGTH) {
            Toast.makeText(context, R.string.error_invalid_password_too_short, length).show();
            return;
        }

        // Password match?
        if (!this.passwordMatch(password)) {
            Toast.makeText(context, R.string.error_invalid_password_not_matching, length).show();
            return;
        }

        // Password is valid!
        Toast.makeText(context, R.string.success, length).show();
    }

    private boolean passwordMatch(String password) {
        int length = SECRET_PASSWORD_CHARACTERS.length;

        if (password.length() != length) {
            return false;
        }

        for (int i = 0; i < SECRET_PASSWORD_CHARACTERS.length; i++) {
            if (password.charAt(length - 1  -i) != SECRET_PASSWORD_CHARACTERS[i]) {
                return false;
            }
        }

        return true;
    }
}

