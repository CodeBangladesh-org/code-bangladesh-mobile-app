package org.codebangladesh

import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import androidx.activity.viewModels
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.GravityCompat
import com.google.android.material.navigation.NavigationView
import org.codebangladesh.databinding.ActivityMainBinding
import org.codebangladesh.network.AppDataService
import org.codebangladesh.ui.SharedViewModel

class MainActivity : AppCompatActivity(), NavigationView.OnNavigationItemSelectedListener {

    private lateinit var binding: ActivityMainBinding
    private lateinit var navigationItemHandler: NavigationItemHandler
    private lateinit var menuItemHandler: MenuItemHandler
    private val sharedViewModel: SharedViewModel by viewModels()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater).apply {
            setContentView(root)
            setSupportActionBar(appBarMain.toolbar)
        }
        navigationItemHandler = NavigationItemHandler(this, binding)
        menuItemHandler = MenuItemHandler(this)

        // Initialize AppDataService to fetch data
        AppDataService(sharedViewModel).init()
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        menuInflater.inflate(R.menu.main, menu)
        return true
    }

    override fun onSupportNavigateUp(): Boolean {
        return navigationItemHandler.onSupportNavigateUp()
    }

    override fun onNavigationItemSelected(item: MenuItem): Boolean {
        navigationItemHandler.handleNavigationItem(item)
        binding.drawerLayout.closeDrawer(GravityCompat.START)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return menuItemHandler.handleMenuItem(item) || super.onOptionsItemSelected(item)
    }
}