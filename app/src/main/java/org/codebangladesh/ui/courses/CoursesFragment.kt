package org.codebangladesh.ui.courses

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import androidx.lifecycle.ViewModelProvider
import androidx.recyclerview.widget.LinearLayoutManager
import com.bumptech.glide.Glide
import org.codebangladesh.databinding.FragmentCoursesBinding
import org.codebangladesh.extensions.loadAssetImage
import org.codebangladesh.ui.SharedViewModel

class CoursesFragment : Fragment() {

    private var _binding: FragmentCoursesBinding? = null
    private val binding get() = _binding!!
    private lateinit var sharedViewModel: SharedViewModel
    private lateinit var categoryName: String

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        arguments?.let {
            categoryName = it.getString("categoryName")!!
        }
        sharedViewModel = ViewModelProvider(requireActivity())[SharedViewModel::class.java]
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View {
        _binding = FragmentCoursesBinding.inflate(inflater, container, false)
        return binding.root
    }

    @SuppressLint("SetTextI18n")
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        sharedViewModel.getCategory(categoryName)?.let { category ->
            // Set data in CardView
            Glide.with(this)
                .loadAssetImage(requireContext().assets, category.imageSource)
                .into(binding.categoryIconImageView)
            binding.categoryNameTextView.text = category.name
            binding.categoryDescTextView.text = category.description


            Glide.with(this)
                .loadAssetImage(requireContext().assets, "img/learning.png")
                .into(binding.numberOfCoursesIconImageView)
            binding.numberOfCoursesTextView.text = "${category.numberOfCourses} টি কোর্স"

            Glide.with(this)
                .loadAssetImage(requireContext().assets, "img/youtube.png")
                .into(binding.numberOfVideosIconImageView)
            binding.numberOfVideosTextView.text = "${category.numberOfVideos} টি ভিডিও"

            Glide.with(this)
                .loadAssetImage(requireContext().assets, "img/book.png")
                .into(binding.numberOfTopicsIconImageView)
            binding.numberOfTopicsTextView.text = "${category.numberOfTopics} টি টপিক"

            // Set up RecyclerView
            val coursesAdapter = CoursesAdapter(category)
            binding.coursesRecyclerView.apply {
                layoutManager = LinearLayoutManager(context)
                adapter = coursesAdapter
            }
        }
    }

    override fun onDestroyView() {
        super.onDestroyView()
        _binding = null
    }
}