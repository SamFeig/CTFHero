package org.ctf.authenticator;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Resources;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class Authenticator extends Activity {

    private String AUTHENTICATE = "org.ctf.authenticator.authenticate";

    /**
     * Called when the activity is first created.
     */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);

        Button b = (Button) findViewById(R.id.button);
        b.setOnClickListener(new OnClickListener() {
            public void onClick(View v) {
                // Perform action on click
                Resources r = getResources();
                EditText userField = (EditText) findViewById(R.id.userField);
                EditText passField = (EditText) findViewById(R.id.passField);
                String username = userField.getText().toString();
                String password = passField.getText().toString();
                String dec_user = "";
                String dec_pass = "";
                try {
                    dec_user = SimpleCrypto.decrypt("ctf", r.getString(R.string.user));
                    dec_pass = SimpleCrypto.decrypt("ctf", r.getString(R.string.pass));
                } catch (Exception e) {
                    Log.e("APP", e.toString());
                }
                if (dec_user != null && dec_pass != null && dec_user != "" && dec_pass != "") {
                    if (dec_user.equals(username) && dec_pass.equals(password)) {
                        sendBroadcast();
                    } else {
                        Toast.makeText(getApplicationContext(), "Thou are not a Hac30r :(", Toast.LENGTH_LONG).show();
                    }
                } else {
                        Toast.makeText(getApplicationContext(), "Thou are not a Hac30r :(", Toast.LENGTH_LONG).show();
                }
            }
        });
    }

    @Override
    protected void onResume() {
        IntentFilter filter = new IntentFilter();
        filter.addAction(AUTHENTICATE);
        registerReceiver(receiver, filter);
        super.onResume();
    }

    @Override
    protected void onPause() {
        unregisterReceiver(receiver);
        super.onPause();
    }

    public void sendBroadcast() {
        Intent broadcast = new Intent();
        broadcast.setAction(AUTHENTICATE);
        sendBroadcast(broadcast);
    }

    private BroadcastReceiver receiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            Resources r = getResources();
            int[] arr = r.getIntArray(R.array.sec_ints);
            String hexStr = "";
            for (int i = 0; i < arr.length; i++) {
                hexStr += Integer.toHexString(arr[i] - i);
            }
            StringBuilder output = new StringBuilder();
            for (int i = 0; i < hexStr.length(); i += 2) {
                String str = hexStr.substring(i, i + 2);
                output.append((char) Integer.parseInt(str, 16));
            }
            Toast.makeText(getApplicationContext(), output.toString(), Toast.LENGTH_LONG).show();
        }
    };
}
