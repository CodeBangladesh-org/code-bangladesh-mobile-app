package org.codebangladesh

import android.content.Intent
import android.net.Uri
import android.view.MenuItem
import androidx.navigation.findNavController
import androidx.navigation.ui.AppBarConfiguration
import androidx.navigation.ui.navigateUp
import androidx.navigation.ui.setupActionBarWithNavController
import androidx.navigation.ui.setupWithNavController
import org.codebangladesh.databinding.ActivityMainBinding

class NavigationItemHandler(
    private val activity: MainActivity,
    binding: ActivityMainBinding
) {

    private var appBarConfiguration: AppBarConfiguration

    init {
        binding.apply {
            val navController = activity.findNavController(R.id.nav_host_fragment_content_main)
            appBarConfiguration = AppBarConfiguration(
                setOf(R.id.nav_home, R.id.nav_provide_suggestion, R.id.nav_github),
                drawerLayout
            )
            activity.setupActionBarWithNavController(navController, appBarConfiguration)
            navView.setupWithNavController(navController)
            navView.setNavigationItemSelectedListener(activity)
        }
    }

    fun onSupportNavigateUp(): Boolean {
        val navController = activity.findNavController(R.id.nav_host_fragment_content_main)
        return navController.navigateUp(appBarConfiguration) || activity.onSupportNavigateUp()
    }

    fun handleNavigationItem(item: MenuItem) {
        when (item.itemId) {
            R.id.nav_tech_company -> {
                navigateToExternalLink(activity.getString(R.string.menu_tech_companies_link))
            }

            R.id.nav_provide_suggestion -> {
                navigateToExternalLink(activity.getString(R.string.menu_provide_suggestion_link))
            }

            R.id.nav_github -> {
                navigateToExternalLink(activity.getString(R.string.menu_github_link))
            }

            R.id.nav_app_store -> {
                navigateToExternalLink(activity.getString(R.string.menu_app_store_link))
            }

            R.id.nav_web_version -> {
                navigateToExternalLink(activity.getString(R.string.menu_web_version_link))
            }

            R.id.nav_about_us -> {
                navigateToExternalLink(activity.getString(R.string.menu_about_us_link))
            }
        }
    }

    private fun navigateToExternalLink(url: String) {
        activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
    }
}