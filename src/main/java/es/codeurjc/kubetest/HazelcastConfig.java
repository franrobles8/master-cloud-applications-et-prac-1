package es.codeurjc.kubetest;

import com.hazelcast.config.Config;
import com.hazelcast.core.Hazelcast;
import com.hazelcast.core.HazelcastInstance;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class HazelcastConfig {

	@Bean
	public HazelcastInstance hazelcastInstance() {

		Config config = new Config();

		config.getNetworkConfig().getJoin().getMulticastConfig().setEnabled(false);
		config.getNetworkConfig().getJoin().getKubernetesConfig().setEnabled(true);

		return Hazelcast.newHazelcastInstance(config);
	}
}